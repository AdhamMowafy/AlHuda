﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Admin.Careers
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton Delete = (ImageButton)sender;
            string IDVal = Delete.CommandArgument;
            int id = int.Parse(IDVal);

            HEWDataContext context = new HEWDataContext();
            Model.Vacancy nVacancy = context.Vacancies.SingleOrDefault(i => i.ID == id);
            context.Vacancies.DeleteOnSubmit(nVacancy);
            context.SubmitChanges();
            gvCareers.DataBind();
        }
    }
}