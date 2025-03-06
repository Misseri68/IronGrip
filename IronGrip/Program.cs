using IronGrip.Data;
using IronGrip.Repositories;
using Microsoft.AspNetCore.Localization;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddLocalization(options => options.ResourcesPath = "Resources");
builder.Services.AddControllersWithViews()
    .AddViewLocalization()
    .AddDataAnnotationsLocalization();
string connectionString = builder.Configuration.GetConnectionString("SqlServerIronGrip");
builder.Services.AddDbContext<IronGripContext>(options =>
{
    options.UseSqlServer(connectionString);
});
builder.Services.AddSession();
builder.Services.AddHttpContextAccessor();
builder.Services.AddTransient<AuthRepository>();
builder.Services.AddTransient<TagRepository>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

var supportedCultures = new[]
{
    new CultureInfo("es"),
    new CultureInfo("en") 
};

app.UseRequestLocalization(new RequestLocalizationOptions
{
    DefaultRequestCulture = new RequestCulture("es"),
    SupportedCultures = supportedCultures, 
    SupportedUICultures = supportedCultures 
});

app.UseStaticFiles();


app.UseRouting();

app.UseAuthorization();

app.MapStaticAssets();

app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Auth}/{action=Login}/{id?}")
    .WithStaticAssets();


app.Run();
