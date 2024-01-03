using Bogus;
using Kabutech.Api.Shared.Mushrooms.Analyze;

namespace Kabutech.Api.DataAccess.Mushrooms.Analyze;

[RepositoryService]
public partial class Repository
{
    public async Task<OneOf<ResultDto, ServiceError>> ExecuteAsync(string imageString, CancellationToken ct)
    {
        var analysis = GetDummyData().OrderByDescending(d => d.Score).Take(1).First();
        return await Task.FromResult(analysis);
    }

    private List<ResultDto> GetDummyData()
    {
        var faker = new Faker();

        return
        [
            new()
            {
                Score = faker.Random.Double(0.10, 0.95),
                Name = "Blue Oyster Mushroom",
                Description = "The Blue Oyster Mushroom is a healthy variant of Pleurotus ostreatus characterized by its striking blue-gray to bluish-lilac coloration. It has a mild, delicate flavor and a distinctive appearance, with a cap that ranges in shades of blue and gills that appear whitish or gray. This variety is commonly cultivated for its culinary uses and nutritional benefits.",
                Disease = "",
                Poisonous = false
            },
            new()
            {
                Score = faker.Random.Double(0.10, 0.95),
                Name = "Pleurotus ostreatus",
                Description = "This strain of Pleurotus ostreatus exhibits symptoms of yellowing disease, characterized by the appearance of yellow spots or patches on the cap and stem. The yellowing progresses over time, causing discoloration and deterioration of the mushroom's appearance. It might also impact the mushroom's texture and taste, making it less desirable for consumption.",
                Disease = "Yellowing disease",
                Poisonous = false
            },
            new()
            {
                Score = faker.Random.Double(0.10, 0.95),
                Name = "Pleurotus ostreatus",
                Description = "Causes soft, slimy decay in oyster mushroom tissue due to bacterial infection, leading to rapid deterioration.",
                Disease = "Bacterial Soft Rot",
                Poisonous = false
            },
            new()
            {
                Score = faker.Random.Double(0.10, 0.95),
                Name = "Fool's Mushroom",
                Description = "Amanita verna, commonly referred to as the Fool's Mushroom, is a deadly poisonous fungus. It bears a resemblance to some edible mushrooms, especially the Agaricus species, which can lead to fatal confusion for foragers. The Fool's Mushroom typically has a white to pale gray cap with a smooth surface, white gills, and a white stalk. It lacks any distinctive or strong odor.",
                Disease = "",
                Poisonous = true
            },
        ];
    }
}