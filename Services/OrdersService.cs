using Mapster;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using SampleCommerce.Common;
using SampleCommerce.DTOs.Order;
using SampleCommerce.DTOs.OrderItem;
using SampleCommerce.Models;
using SampleCommerce.Repositories;

namespace SampleCommerce.Services
{
    public class OrdersService : IService<int, DtoOrderResponse, DtoOrderCreate, DtoOrderUpdate>
    {
        private readonly OrdersRepo _ordersRepo;
        private readonly SkusRepo _skusRepo;
        public OrdersService(OrdersRepo ordersRepo, SkusRepo skusRepo)
        {
            _ordersRepo = ordersRepo;
            _skusRepo = skusRepo;
        }

        public Result<DtoOrderResponse> Create(DtoOrderCreate dto)
        {
            //VALIDATE
            foreach (DtoOrderItemCreate dtoItemOrder in dto.Items)
            {
                if (dtoItemOrder.Quantity <= 0)
                    return Result<DtoOrderResponse>.Fail(ErrorMessages.InvalidQuantity);
            }

            //This using is like using for files, to close it by itself.
            using IDbContextTransaction transaction = _ordersRepo.BeginTransaction();
            // BUSINESS RULES VALIDATION
            // TODO: VALIDATE ADDRESS BELONGS TO THE USER, OR SHOULD ADD A NEW ONE.
            
            // SAVE TO DATABASE
            try
            {
                List<Guid> skuIds = dto.Items.Select(i => i.SkuId).ToList();
                List<StockKeepingUnit> skus = _skusRepo.GetWhere(s => skuIds.Contains(s.Id)).ToList();

                Order order = new Order
                {
                    UserId = dto.UserId,
                    AddressId = dto.AddressId,
                    CreatedAt = DateTime.Now,
                    TotalPrice = 0 // Must start with Zero, can avoid memory trash errors
                };

                foreach (DtoOrderItemCreate dtoItemOrder in dto.Items)
                {
                    StockKeepingUnit? sku = skus.FirstOrDefault(s => s.Id == dtoItemOrder.SkuId);
                    // Here we must throw Exception in order to rollback the transaction
                    if (sku == null) 
                        throw new Exception(ErrorMessages.ProductNotFound);
                    if (sku.Stock < dtoItemOrder.Quantity)
                        throw new Exception(ErrorMessages.InsufficientStock);
                    sku.Stock -= dtoItemOrder.Quantity;
                    OrderItem orderItem = new OrderItem
                    {
                        SkuId = sku.Id,
                        Quantity = dtoItemOrder.Quantity,
                        MomentPrice = sku.Price
                    };
                    order.OrderItems.Add(orderItem);
                    order.TotalPrice += (decimal)(orderItem.MomentPrice * orderItem.Quantity);
                }
                _ordersRepo.Create(order);
                transaction.Commit();
                return Result<DtoOrderResponse>.Ok(order.Adapt<DtoOrderResponse>());
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                return Result<DtoOrderResponse>.Fail(ex.Message);
            }
        }//Create

        public Result Delete(int id)
        {
            throw new NotImplementedException();
        }//Delete

        public Result<DtoOrderResponse> Read(int id)
        {
            Order? order = _ordersRepo.GetById(id);
            if(order == null)
                return Result<DtoOrderResponse>.Fail(ErrorMessages.OrderNotFound);
            return Result<DtoOrderResponse>.Ok(order.Adapt<DtoOrderResponse>());
        }//Read

        public Result<List<DtoOrderResponse>> ReadAll()
        {
            throw new NotImplementedException();
        }//ReadAll

        public Result<DtoOrderResponse> Update(int id, DtoOrderUpdate dto)
        {
            throw new NotImplementedException();
        }//Update

        public Result<List<DtoOrderResponse>> ReadAllByUser(Guid userId)
        {
            List<Order>? orders = _ordersRepo.GetAllByUser(userId);
            if(orders is null || orders.Count == 0)
                return Result<List<DtoOrderResponse>>.Ok([]);
            return Result<List<DtoOrderResponse>>.Ok(orders.Adapt<List<DtoOrderResponse>>());
        }//ReadAllByUser
    }
}
