using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using HEW.Model.ModelViews;

namespace HEW.Model.Repositories
{
    
    public class ProjectsRepository
    {
        static HEWDataContext _ModelDbContext;

        public static List<ProjectsCategory> GetProjectsCategories()
        {
            _ModelDbContext = new HEWDataContext();
            return _ModelDbContext.ProjectsCategories.ToList();
        }

        public static List<ProjectModelViews> GetProjectsByCategory(int projectCategory)
        {
            _ModelDbContext = new HEWDataContext();
            List<ProjectModelViews> projetList = (from pr in _ModelDbContext.Projects
                                                  where pr.CategoryID == projectCategory
                                                  select new ProjectModelViews
                                                      {
                                                          ID = pr.ID,
                                                          Name = pr.Name,
                                                          ImgsCount = pr.ProjectsImages.Count
                                                      }).ToList();
            return projetList;
        }

        public static string GetRandomImg(int projectId, int count)
        {
            _ModelDbContext = new HEWDataContext();
            Random rd = new Random();
            int rndImg = rd.Next(0, count);
            var project =
                _ModelDbContext.ProjectsImages.Where(i => i.ProjectID == projectId).Skip(rndImg).Take(1).SingleOrDefault();
            if (project != null)
                return project.ImgPublicID;
            return "";
        }

        public static Project GetProjectItem(int projectId)
        {
            _ModelDbContext = new HEWDataContext();
            return _ModelDbContext.Projects.SingleOrDefault(i => i.ID == projectId);
        }
    }
}