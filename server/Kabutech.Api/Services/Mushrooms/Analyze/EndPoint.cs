using FastEndpoints;
using Kabutech.Api.DataAccess.Mushrooms.Analyze;
using Kabutech.Api.Shared.Mushrooms.Analyze;

namespace Kabutech.Api.Services.Mushrooms.Analyze;

public class EndPoint(IRepositoryFactory factory) : Endpoint<Request>
{
    public override void Configure()
    {
        Post("analyze");
        AllowFileUploads();
        AllowAnonymous();
    }

    public override async Task HandleAsync(Request request, CancellationToken ct)
    {
        try
        {
            byte[] imageBytes;
            using (var stream = new MemoryStream())
            {
                await request.Image.CopyToAsync(stream, ct);
                imageBytes = stream.ToArray();
            }
            var imageString = Convert.ToBase64String(imageBytes);

            var repository = factory.Create<Repository>();

            var result = await repository.ExecuteAsync(imageString, ct);

            await result.Match(
                diagnosis => SendAsync(diagnosis, cancellation: ct),
                error =>
                {
                    AddError(error.Message);
                    return SendErrorsAsync(cancellation: ct);
                });
        }
        catch (OperationCanceledException)
        {
            //ignore
        }
    }
}