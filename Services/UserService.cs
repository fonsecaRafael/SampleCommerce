using Mapster;
using SampleCommerce.Common;
using SampleCommerce.DTOs.Users;
using SampleCommerce.Models;
using SampleCommerce.Repositories;

namespace SampleCommerce.Services
{
    public class UserService : IService<Guid, DtoUserResponse, DtoUserCreateRequest, DtoUserUpdateRequest>
    {
        private readonly UserRepo _userRepo;
        public UserService(UserRepo userRepo)
        {
            _userRepo = userRepo;
        }
        public Result<DtoUserResponse> Create(DtoUserCreateRequest userDto)
        {
            var preValidated = PreValidate(userDto);
            if (!preValidated.Success)
                return Result<DtoUserResponse>.Fail(preValidated.Errors);
            
            // BUSINESS RULES VALIDATION
            if (_userRepo.EmailExists(userDto.Email))
                return Result<DtoUserResponse>.Fail(ErrorMessages.EmailAlreadyExists);
            
            // SAVE TO DATABASE
            try
            {
                User user = userDto.Adapt<User>();
                _userRepo.Create(user);
                return Result<DtoUserResponse>.Ok(user.Adapt<DtoUserResponse>());
            }
            catch (Exception ex)
            {
                return Result<DtoUserResponse>.Fail(ex.Message);
            }
        }//Create
        public Result<DtoUserResponse> Read(Guid id)
        {
            User? user = _userRepo.GetById(id);
            if (user is null)
                return Result<DtoUserResponse>.Fail(ErrorMessages.UserNotFound);
            return Result<DtoUserResponse>.Ok(user.Adapt<DtoUserResponse>()); 
        }//Read
        public Result<List<DtoUserResponse>> ReadAll()
        {
            List<User> users = _userRepo.GetAll();
            if (users is null || users.Count == 0)
            {
                return Result<List<DtoUserResponse>>.Ok([]);
            }
            return Result<List<DtoUserResponse>>.Ok(users.Adapt<List<DtoUserResponse>>());
        }
        public Result<DtoUserResponse> Update(Guid id, DtoUserUpdateRequest userDto)
        {
            Result preValidated = PreValidate(userDto);
            if (!preValidated.Success)
                return Result<DtoUserResponse>.Fail(preValidated.Errors);

            User? existingUser = _userRepo.GetById(id);
            if (existingUser is null) 
                return Result<DtoUserResponse>.Fail(ErrorMessages.UserNotFound);

            if (existingUser.Email != userDto.Email && _userRepo.EmailExists(userDto.Email))
                return Result<DtoUserResponse>.Fail(ErrorMessages.EmailAlreadyExists);
            try
            {
                userDto.Adapt(existingUser);
                _userRepo.Update(existingUser);
                return Result<DtoUserResponse>.Ok(existingUser.Adapt<DtoUserResponse>());
            }
            catch (Exception ex)
            {
                return Result<DtoUserResponse>.Fail(ex.Message);
            }
        }//Update
        public Result Delete(Guid id)
        {
            User? user = _userRepo.GetById(id);
            if (user is null) 
                return Result.Fail(ErrorMessages.UserNotFound);
            try
            {
                _userRepo.Delete(user);
                return Result.Ok();
            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            }
        }//Delete
        private Result PreValidate(IUserDto dto)
        {
            SanitizeUser(dto);
            var errors = ValidateUserStructure(dto);
            if (errors.Any())
                return Result.Fail(errors);
            return Result.Ok();
        }//PreValidate
        private void SanitizeUser(IUserDto dto)
        {
            if (dto == null) return;
            if (!string.IsNullOrWhiteSpace(dto.Email))
                dto.Email = dto.Email.Trim().ToLower();
            if (!string.IsNullOrWhiteSpace(dto.Name))
                dto.Name = dto.Name.Trim();
            if (!string.IsNullOrWhiteSpace(dto.TradingName))
                dto.TradingName = dto.TradingName.Trim();
        }//SanitizeUser
        private List<string> ValidateUserStructure(IUserDto dto)
        {
            var errors = new List<string>();
            if (!string.IsNullOrEmpty(dto.Name) && dto.Name.Any(char.IsDigit))
                errors.Add(ErrorMessages.InvalidName);
            if (dto.Seller)
            {
                if (string.IsNullOrEmpty(dto.Iva)) errors.Add(ErrorMessages.MissingIVA);
                if (string.IsNullOrEmpty(dto.TradingName)) errors.Add(ErrorMessages.MissingTradingName);
            }
            if (!string.IsNullOrEmpty(dto.Iva) && dto.Iva?.Length > 11)
                errors.Add(ErrorMessages.IvaSizeViolation);
            return errors;
        }//ValidateUserStructure
    }
}
