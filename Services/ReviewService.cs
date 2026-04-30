using Mapster;
using SampleCommerce.Common;
using SampleCommerce.DTOs.Reviews;
using SampleCommerce.Models;
using SampleCommerce.Repositories;

namespace SampleCommerce.Services
{
    public class ReviewService : IService<int, DtoReviewsResponse, DtoReviewsCreate, DtoReviewsUpdate>
    {
        private readonly ReviewsRepo _repository;
        public ReviewService(ReviewsRepo repository)
        {
            _repository = repository;
        }
        
        public Result<DtoReviewsResponse> Create(DtoReviewsCreate dto)
        {
            // VALIDATE
            //var preValidated = PreValidate(userDto);
            //if (!preValidated.Success)
            //    return Result<DtoUserResponse>.Fail(preValidated.Errors);

            // BUSINESS RULES VALIDATION

            // SAVE TO DATABASE
            try
            {
                Review review = dto.Adapt<Review>();
                _repository.Create(review);
                return Result<DtoReviewsResponse>.Ok(review.Adapt<DtoReviewsResponse>());
            }
            catch (Exception ex)
            {
                return Result<DtoReviewsResponse>.Fail(ex.Message);
            }
        }//Create
        public Result<DtoReviewsResponse> Read(int id)
        {
            Review? review = _repository.GetById(id);
            if (review is null)
                return Result<DtoReviewsResponse>.Fail(ErrorMessages.ReviewNotFound);
            return Result<DtoReviewsResponse>.Ok(review.Adapt<DtoReviewsResponse>());
        }//Read
        public Result<List<DtoReviewsResponse>> ReadAll()
        {
            //TODO: THIS DON'T EXISTS SHOULD BE ReadAllByProduct()
            List<Review> review = _repository.GetAll();
            if (review is null || review.Count == 0)
            {
                return Result<List<DtoReviewsResponse>>.Ok([]);
            }
            return Result<List<DtoReviewsResponse>>.Ok(review.Adapt<List<DtoReviewsResponse>>());
        }//ReadAll
        public Result<DtoReviewsResponse> Update(int id, DtoReviewsUpdate dto)
        {
            //VALIDATE
            //Result preValidated = PreValidate(userDto);
            //if (!preValidated.Success)
            //    return Result<DtoUserResponse>.Fail(preValidated.Errors);

            Review? existingReview = _repository.GetById(id);
            if (existingReview is null)
                return Result<DtoReviewsResponse>.Fail(ErrorMessages.ReviewNotFound);

            // VALIDATE BUSSINESS RULE
            try
            {
                dto.Adapt(existingReview);
                _repository.Update(existingReview);
                return Result<DtoReviewsResponse>.Ok(existingReview.Adapt<DtoReviewsResponse>());
            }
            catch (Exception ex)
            {
                return Result<DtoReviewsResponse>.Fail(ex.Message);
            }
        }//Update
        public Result Delete(int id)
        {
            Review? review = _repository.GetById(id);
            if (review is null)
                return Result.Fail(ErrorMessages.ReviewNotFound);
            try
            {
                _repository.Delete(review);
                return Result.Ok();
            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            }
        }//Delete
    }
}
