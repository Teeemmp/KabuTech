namespace Kabutech.Api.Shared.Mushrooms.Analyze;

public sealed class ResultDto
{
    public double Score { get; set; }
    public string Name { get; set; } = default!;
    public string Description { get; set; } = string.Empty;
    public bool Poisonous { get; set; }
    public string Disease { get; set; } = string.Empty;
}
