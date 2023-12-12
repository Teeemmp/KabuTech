using FastEndpoints;
using Kabutech.Api.DataAccess.Users.UpdateImage;
using Kabutech.Api.Shared.Users;
using Kabutech.Api.Shared.Users.UpdateImage;

namespace Kabutech.Api.Services.Users.UpdateImage;

public sealed class EndPoint(IRepositoryFactory factory) : Endpoint<Request, UserDto>
{
    public override void Configure()
    {
        Put("/users/image");
    }

    public override async Task HandleAsync(Request req, CancellationToken ct)
    {
        var modifiedBy = User.Claims.First(i => i.Type == "id").Value;

        if (req.Id != modifiedBy)
            ThrowError("You are not allowed to update this user's credentials", StatusCodes.Status401Unauthorized);

        var repository = factory.Create<Repository>();
        var result = await repository.ExecuteAsync(req, modifiedBy, ct);
        await result.Match<Task>(
            user => SendAsync(user, cancellation: ct),
            error =>
            {
                AddError(error.Message);
                return SendErrorsAsync(cancellation: ct);
            });
    }
}