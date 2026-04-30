
using Microsoft.EntityFrameworkCore;
using SampleCommerce.Context;
using SampleCommerce.Context.Mappings;
using SampleCommerce.Repositories;
using SampleCommerce.Services;

namespace SampleCommerce
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();


            #region adds dbContext
            string ConnectionString = "Insert the connection string";
            ConnectionString = builder.Configuration.GetSection("ConnectionString").Value!.ToString();
            builder.Services.AddDbContext<EcommerceDbContext>(
                          options => options.UseSqlServer(ConnectionString
                          )
                          );
            #endregion
            #region adds Repos and services
            builder.Services.AddScoped<UserRepo>();
            builder.Services.AddScoped<UserService>();
            builder.Services.AddScoped<AddressRepo>();
            builder.Services.AddScoped<AddressService>();
            builder.Services.AddScoped<OrdersRepo>();
            builder.Services.AddScoped<OrdersService>();
            builder.Services.AddScoped<ProductRepo>();
            builder.Services.AddScoped<ProductService>();
            builder.Services.AddScoped<ReviewsRepo>();
            builder.Services.AddScoped<ReviewService>();
            builder.Services.AddScoped<SkusRepo>();
            builder.Services.AddScoped<SkuService>();
            #endregion
            MapsterConfig.Configure();
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();
            app.UseAuthorization();
            app.MapControllers();
            app.Run();
        }
    }
}
