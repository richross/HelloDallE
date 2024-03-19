using HelloDallE8.Components;
using HelloDallE8.Models;
using HelloDallE8.Services;
using Microsoft.FluentUI.AspNetCore.Components;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();

//configuration settings
//builder.Configuration.AddUserSecrets<AzureOpenAISettings>();

//AzureOpenAISettings
builder.Services.AddSingleton<IAzureOpenAISettings>(new AzureOpenAISettings(builder.Configuration));

//Azure Blob Storage Settings
builder.Services.AddSingleton<IAzureBlobStorageSettings>(new AzureBlobStorageSettings(builder.Configuration));

builder.Services.AddSingleton<IDataService, DataService>();
builder.Services.AddScoped<ResponseState>();
builder.Services.AddScoped<ImageMetadataState>();
builder.Services.AddTransient<SemanticKernelTextCompletionService>();

//needed for the FluentUI components

// this service might be needed for fluentUI components.
// leaving it here for now but just commenting it out.
//builder.Services.AddHttpClient();
builder.Services.AddFluentUIComponents();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();
