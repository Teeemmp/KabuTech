using MongoSharpen;

namespace Kabutech.Api.DataAccess.Auth;

[Collection("blacklists")]
internal sealed class BlackList : BaseDocument
{
    [AsObjectId]
    public string UserId { get; init; } = string.Empty;
}