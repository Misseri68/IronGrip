using IronGrip.Data;

namespace IronGrip.Repositories
{
    public class TagRepository
    {
        IronGripContext context;
        public TagRepository(IronGripContext context) {
            this.context = context;
        }

        public async Task CreateTagAsync() { 
            
        }
    }
}
