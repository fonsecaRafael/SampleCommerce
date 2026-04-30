using Microsoft.AspNetCore.Mvc;
using SampleCommerce.Common;
using SampleCommerce.DTOs.Users;
using SampleCommerce.Services;

namespace SampleCommerce.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : BaseController
    {
        private readonly UserService _service;
        public UserController(UserService service) 
        {
            _service = service;
        }

        [HttpPost]
        public IActionResult Create([FromBody] DtoUserCreateRequest userDto)
        {
            Result<DtoUserResponse> result = _service.Create(userDto);
            if (!result.Success)
                return BadRequest(result);
            return CreatedAtAction(nameof(Read), new { id = result.Data!.Id }, result.Data);
        }//Create

        [HttpGet("{id}")]
        public IActionResult Read(Guid id)
        {
            Result<DtoUserResponse> result = _service.Read(id);
            if (!result.Success)
                return NotFound(result);
            return Ok(result.Data);
        }//Read

        [HttpGet]
        public IActionResult ReadAll()
        {
            Result<List<DtoUserResponse>>? result = _service.ReadAll();
            return Ok(result.Data);
        }

        [HttpPut("{id}")]
        public IActionResult Update(Guid id, [FromBody] DtoUserUpdateRequest userDto)
        {
            Result<DtoUserResponse> result = _service.Update(id, userDto);
            return ProcessResult(result, () => Ok(result.Data));
        }//Update

        [HttpDelete("{id}")]
        public IActionResult Delete(Guid id)
        {
            Result result = _service.Delete(id);
            return ProcessResult(result, () => NoContent());
        }
    }
}
