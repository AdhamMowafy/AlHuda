using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Admin.Careers
{
    public partial class New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtOpeningDate.Attributes.Add("readonly", "readonly");
            if (!IsPostBack)
            {
                int vacancyId = 0;
                if (Request.QueryString["ID"] != null)
                {
                    if (int.TryParse(Request.QueryString["ID"], out vacancyId))
                        RenderVacancyItem(vacancyId);
                }
            }
        }

        private void RenderVacancyItem(int vacancyItem)
        {
            Model.Vacancy vacancyObj = Model.Repositories.CareersRepository.GetVacancy(vacancyItem);
            if (vacancyObj == null)
                Response.Redirect("Default.aspx");

            txtVacancy.Text = vacancyObj.Vacancy1;
            ddlCategories.SelectedValue = vacancyObj.CategoryID.ToString();
            txtLocation.Text = vacancyObj.Location;
            txtDescription.Text = vacancyObj.JobDescription;
            txtSkills.Text = vacancyObj.RequiredSkills;
            txtOpenings.Text = vacancyObj.Openings.ToString();
            txtOpeningDate.Text = vacancyObj.OpeningDate.ToString("dd/MM/yyyy");
            cbIsPublished.Checked = vacancyObj.IsPublished;
        }

        private void AddVacany()
        {
            HEWDataContext context = new HEWDataContext();
            Vacancy vacancyObj = new Vacancy();
            vacancyObj.Vacancy1 = txtVacancy.Text.Trim();
            vacancyObj.Location = txtLocation.Text.Trim();
            vacancyObj.IsPublished = cbIsPublished.Checked;
            vacancyObj.OpeningDate = Convert.ToDateTime(txtOpeningDate.Text);
            vacancyObj.JobDescription = txtDescription.Text.Trim();
            vacancyObj.RequiredSkills = txtSkills.Text.Trim();
            vacancyObj.Openings = Int16.Parse(txtOpenings.Text.Trim());
            vacancyObj.CategoryID = int.Parse(ddlCategories.SelectedValue);
            context.Vacancies.InsertOnSubmit(vacancyObj);
            context.SubmitChanges();

            Response.Redirect("Default.aspx");
        }

        private void EditVacancy(int vacancyId)
        {
            HEWDataContext context = new HEWDataContext();
            var vacancyObj = context.Vacancies.SingleOrDefault(i => i.ID == vacancyId);
            vacancyObj.Vacancy1 = txtVacancy.Text.Trim();
            vacancyObj.Location = txtLocation.Text.Trim();
            vacancyObj.IsPublished = cbIsPublished.Checked;
            vacancyObj.OpeningDate = Convert.ToDateTime(txtOpeningDate.Text);
            vacancyObj.JobDescription = txtDescription.Text.Trim();
            vacancyObj.RequiredSkills = txtSkills.Text.Trim();
            vacancyObj.Openings = Int16.Parse(txtOpenings.Text.Trim());
            vacancyObj.CategoryID = int.Parse(ddlCategories.SelectedValue);
            context.SubmitChanges();

            Response.Redirect(Request.RawUrl);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
                AddVacany();
            else
                EditVacancy(int.Parse(Request.QueryString["ID"]));
        }
    }
}