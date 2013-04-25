using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace HEW.Model.Repositories
{
    
    public class ProjectsRepository
    {
        static HEWDataContext _ModelDbContext = new HEWDataContext();

        public static List<ProjectsCategory> GetProjectsCategories()
        {
            return _ModelDbContext.ProjectsCategories.ToList();
        }

        public static IEnumerable GetProjectsByCategory(int projectCategory)
        {
            return (from pr in _ModelDbContext.Projects
                    where pr.CategoryID == projectCategory
                    select new {pr.ID, pr.Name, ImgsCount = pr.ProjectsImages.Count}).ToList();
        }

        public static string GetRandomImg(int projectId, int count)
        {
            Random rd = new Random();
            int rndImg = rd.Next(0, count);
            var project =
                _ModelDbContext.ProjectsImages.Where(i => i.ProjectID == projectId).Skip(rndImg).Take(1).SingleOrDefault();
            if (project != null)
                return project.ImgPublicID;
            return "";
        }
    }
}