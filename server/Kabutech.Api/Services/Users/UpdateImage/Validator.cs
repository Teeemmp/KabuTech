using FastEndpoints;
using FluentValidation;
using Kabutech.Api.Shared.Users.UpdateImage;

namespace Kabutech.Api.Services.Users.UpdateImage;

public sealed class Validator : Validator<Request>
{
    public Validator()
    {
        RuleFor(x => x.Id)
            .NotEmpty()
            .WithMessage("Required field");
    }
}