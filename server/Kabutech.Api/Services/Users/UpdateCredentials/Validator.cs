﻿using FastEndpoints;
using FluentValidation;
using Kabutech.Api.Shared.Users.UpdateCredentials;

namespace Kabutech.Api.Services.Users.UpdateCredentials;

public sealed class Validator : Validator<Request>
{
    public Validator()
    {
        RuleFor(x => x.CurrentUsername)
            .NotEmpty()
            .WithMessage("Required field");
        RuleFor(x => x.CurrentPassword)
            .NotEmpty()
            .WithMessage("Required field");
        RuleFor(x => x.NewPassword)
            .NotEmpty()
            .WithMessage("Required field")
            .MinimumLength(5)
            .WithMessage("Password is too short");
    }
}