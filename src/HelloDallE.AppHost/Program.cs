var builder = DistributedApplication.CreateBuilder(args);

builder.AddProject<Projects.HelloDallE8>("hellodalle8");

builder.Build().Run();
