using Mapster;
using SampleCommerce.Common;
using SampleCommerce.DTOs.SKUs;
using SampleCommerce.Models;
using SampleCommerce.Repositories;

namespace SampleCommerce.Services
{
    public class SkuService : IService<Guid, DtoSkusResponse, DtoSkusCreate, DtoSkusUpdate>
    {
        private readonly SkusRepo _repository;
        public SkuService(SkusRepo repository)
        {
            _repository = repository;
        }
        public Result<DtoSkusResponse> Create(DtoSkusCreate dto)
        {
            // VALIDATE
            //var preValidated = PreValidate(userDto);
            //if (!preValidated.Success)
            //    return Result<DtoUserResponse>.Fail(preValidated.Errors);

            // BUSINESS RULES VALIDATION

            // SAVE TO DATABASE
            try
            {
                StockKeepingUnit sku = dto.Adapt<StockKeepingUnit>();
                _repository.Create(sku);
                return Result<DtoSkusResponse>.Ok(sku.Adapt<DtoSkusResponse>());
            }
            catch (Exception ex)
            {
                return Result<DtoSkusResponse>.Fail(ex.Message);
            }
        }//Create
        public Result<DtoSkusResponse> Read(Guid id)
        {
            StockKeepingUnit? sku = _repository.GetById(id);
            if (sku is null)
                return Result<DtoSkusResponse>.Fail(ErrorMessages.SKUsNotFound);
            return Result<DtoSkusResponse>.Ok(sku.Adapt<DtoSkusResponse>());
        }//Read
        public Result<List<DtoSkusResponse>> ReadAll()
        {
            //This only exists because Interface.
            throw new NotImplementedException();
        }//ReadAll
        public Result<DtoSkusResponse> Update(Guid id, DtoSkusUpdate dto)
        {
            //VALIDATE
            //Result preValidated = PreValidate(userDto);
            //if (!preValidated.Success)
            //    return Result<DtoUserResponse>.Fail(preValidated.Errors);

            StockKeepingUnit? existingSku = _repository.GetById(id);
            if (existingSku is null)
                return Result<DtoSkusResponse>.Fail(ErrorMessages.SKUsNotFound);

            // VALIDATE BUSSINESS RULE
            try
            {
                dto.Adapt(existingSku);
                _repository.Update(existingSku);
                return Result<DtoSkusResponse>.Ok(existingSku.Adapt<DtoSkusResponse>());
            }
            catch (Exception ex)
            {
                return Result<DtoSkusResponse>.Fail(ex.Message);
            }
        }//Update
        public Result Delete(Guid id)
        {
            StockKeepingUnit? sku = _repository.GetById(id);
            if (sku is null)
                return Result.Fail(ErrorMessages.SKUsNotFound);
            try
            {
                _repository.Delete(sku);
                return Result.Ok();
            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            }
        }//Delete
    }
}
