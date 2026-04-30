using Mapster;
using SampleCommerce.Common;
using SampleCommerce.DTOs.Product;
using SampleCommerce.Models;
using SampleCommerce.Repositories;
using System.Text.Json;

namespace SampleCommerce.Services
{
    public class ProductService : IService<Guid, DtoProductResponse, DtoProductCreate, DtoProductUpdate>
    {
        private readonly ProductRepo _productRepo;
        public ProductService(ProductRepo productRepo)
        {
            _productRepo = productRepo;
        }
        public Result<DtoProductResponse> Create(DtoProductCreate dto)
        {
            //VALIDATE
            // Sanitize values 
            // BUSINESS RULES VALIDATION
            // SAVE TO DATABASE
            try
            {
                Product product = dto.Adapt<Product>();
                product.IsActive = true;
                _productRepo.Create(product);
                return Result<DtoProductResponse>.Ok(product.Adapt<DtoProductResponse>());
            }
            catch (Exception ex)
            {
                return Result<DtoProductResponse>.Fail(ex.Message);
            }
        }//Create

        public Result Delete(Guid id)
        {
            Product? product = _productRepo.GetById(id);
            if (product is null)
                return Result.Fail(ErrorMessages.ProductNotFound);
            try
            {
                _productRepo.Delete(product);
                return Result.Ok();
            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            }
        }//Delete

        public Result<DtoProductResponse> Read(Guid id)
        {
            Product? product = _productRepo.GetById(id);
            if (product is null)
                return Result<DtoProductResponse>.Fail(ErrorMessages.ProductNotFound);
            return Result<DtoProductResponse>.Ok(product.Adapt<DtoProductResponse>());
        }//Read

        public Result<List<DtoProductResponse>> ReadAll()
        {
            List<Product>? products = _productRepo.GetAll();
            if(products is null || products.Count == 0)
                return Result<List<DtoProductResponse>>.Ok([]);
            return Result<List<DtoProductResponse>>.Ok(products.Adapt<List<DtoProductResponse>>());
        }//ReadAll

        public Result<DtoProductResponse> Update(Guid id, DtoProductUpdate dto)
        {
            // TODO: If exists orders with this product, should put it as inactive? but for sure create a new one.
            Product? existingProduct = _productRepo.GetById(id);
            if (existingProduct is null)
                return Result<DtoProductResponse>.Fail(ErrorMessages.ProductNotFound);
            try
            {
                dto.Adapt(existingProduct);
                _productRepo.Update(existingProduct);
                return Result<DtoProductResponse>.Ok(existingProduct.Adapt<DtoProductResponse>());
            }
            catch (Exception ex)
            {
                return Result<DtoProductResponse>.Fail(ex.Message);
            }
        }//Update
    }
}
