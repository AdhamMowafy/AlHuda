using System.Collections.Generic;
using System.Linq;

namespace HEW.Model.Repositories
{
    public class CareersRepository
    {
        static HEWDataContext _ModelDbContext = new HEWDataContext();

        public static List<Vacancy> GetAllVacanciesCategories()
        {
            return _ModelDbContext.Vacancies.ToList();
        }

        public static List<Vacancy> GetPublishVacanciesCategories()
        {
            return _ModelDbContext.Vacancies.Where(i=>i.IsPublished).ToList();
        }
    }
}