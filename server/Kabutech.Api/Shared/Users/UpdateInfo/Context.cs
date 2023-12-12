using System.ComponentModel.DataAnnotations;

namespace Kabutech.Api.Shared.Users.UpdateInfo;

public sealed class Context
{
    [Required(ErrorMessage = "Required field")]
    public string FirstName { get; set; } = string.Empty;

    [Required(ErrorMessage = "Required field")]
    public string LastName { get; set; } = string.Empty;
}