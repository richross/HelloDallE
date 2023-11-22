using HelloDallE.Data;
using HelloDallE.Models;
using HelloDallE.Services;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Azure;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddSingleton<IDataService, DataService>();
builder.Configuration.AddUserSecrets("8fa5b3fd-bf8d-44e7-a9e4-aaa24e11ebda");
builder.Services.AddScoped<IDallEComms, DallEComms>();
builder.Services.AddAzureClients(clientBuilder =>
{
    clientBuilder.AddBlobServiceClient(builder.Configuration["storageAccountConnString:blob"], preferMsi: true);
    clientBuilder.AddQueueServiceClient(builder.Configuration["storageAccountConnString:queue"], preferMsi: true);
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();