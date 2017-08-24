﻿using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using myBudget.DLL;

namespace myEFrom.App_Control.loan_lov
{
    public partial class loan_lov : PageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                imgFind.Attributes.Add("onMouseOver", "src='../../images/button/Search2.png'");
                imgFind.Attributes.Add("onMouseOut", "src='../../images/button/Search.png'");

                if (Request.QueryString["loan_doc"] != null)
                {
                    ViewState["loan_doc"] = Request.QueryString["loan_doc"].ToString();
                    txtloan_doc.Text = ViewState["loan_doc"].ToString();
                }
                else
                {
                    ViewState["loan_doc"] = string.Empty;
                    txtloan_doc.Text = string.Empty;
                }

                if (Request.QueryString["person_code"] != null)
                {
                    ViewState["person_code"] = Request.QueryString["person_code"];
                    txtperson_code.Text = ViewState["person_code"].ToString();
                }
                else
                {
                    ViewState["person_code"] = string.Empty;
                    txtperson_code.Text = string.Empty;
                }

                if (Request.QueryString["person_name"] != null)
                {
                    ViewState["person_name"] = Request.QueryString["person_name"];
                    txtperson_name.Text = ViewState["person_name"].ToString();
                }
                else
                {
                    ViewState["person_name"] = string.Empty;
                    txtperson_name.Text = string.Empty;
                }

                if (Request.QueryString["loan_doc_list"] != null)
                {
                    ViewState["loan_doc_list"] = Request.QueryString["loan_doc_list"];
                }
                else
                {
                    ViewState["loan_doc_list"] = string.Empty;
                }

                if (Request.QueryString["ctrl1"] != null)
                {
                    ViewState["ctrl1"] = Request.QueryString["ctrl1"].ToString();
                }
                else
                {
                    ViewState["ctrl1"] = string.Empty;
                }

                if (Request.QueryString["ctrl2"] != null)
                {
                    ViewState["ctrl2"] = Request.QueryString["ctrl2"].ToString();
                }
                else
                {
                    ViewState["ctrl2"] = string.Empty;
                }

                if (Request.QueryString["ctrl3"] != null)
                {
                    ViewState["ctrl3"] = Request.QueryString["ctrl3"].ToString();
                }
                else
                {
                    ViewState["ctrl3"] = string.Empty;
                }

                if (Request.QueryString["ctrl4"] != null)
                {
                    ViewState["ctrl4"] = Request.QueryString["ctrl4"].ToString();
                }
                else
                {
                    ViewState["ctrl4"] = string.Empty;
                }

                if (Request.QueryString["ctrl5"] != null)
                {
                    ViewState["ctrl5"] = Request.QueryString["ctrl5"].ToString();
                }
                else
                {
                    ViewState["ctrl5"] = string.Empty;
                }




                if (Request.QueryString["lbkGetOpen"] != null)
                {
                    ViewState["lbkGetOpen"] = Request.QueryString["lbkGetOpen"].ToString();
                }
                else
                {
                    ViewState["lbkGetOpen"] = string.Empty;
                }

                if (Request.QueryString["show"] != null)
                {
                    ViewState["show"] = Request.QueryString["show"].ToString();
                }
                else
                {
                    ViewState["show"] = "1";
                }

                if (Request.QueryString["from"] != null)
                {
                    ViewState["from"] = Request.QueryString["from"].ToString();
                }
                else
                {
                    ViewState["from"] = string.Empty;
                }

                ViewState["sort"] = "loan_doc";
                ViewState["direction"] = "ASC";
                BindGridView();
            }
            else
            {
                BindGridView();
            }
        }

        #region private function

        private void BindGridView()
        {
            var objEfLoan = new cefLoan();
            var dt = new DataTable();
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            string strloan_doc = string.Empty;
            string strloan_reason = string.Empty;
            string strperson_code = string.Empty;
            string strperson_name = string.Empty;
            string strScript = string.Empty;
            strloan_doc = txtloan_doc.Text.Replace("'", "''").Trim();
            strloan_reason = txtloan_reason.Text.Replace("'", "''").Trim();
            strperson_code = txtperson_code.Text.Replace("'", "''").Trim();
            strperson_name = txtperson_name.Text.Replace("'", "''").Trim();
            if (!strloan_doc.Equals(""))
            {
                strCriteria += "  And  (loan_doc like '%" + strloan_doc + "%') ";
            }
            if (!strloan_reason.Equals(""))
            {
                strCriteria += "  And  (loan_reason like '%" + strloan_reason + "%') ";
            }

            if (!strperson_code.Equals(""))
            {
                strCriteria = strCriteria + "  And  (person_code= '" + strperson_code + "') ";
            }

            if (!strperson_name.Equals(""))
            {
                strCriteria = strCriteria + "  And  (person_thai_name like '%" + strperson_name + "%'  " +
                                                              "  OR person_thai_surname like '%" + strperson_name + "%'  " +
                                                              "  OR '" + strperson_name + "' like ('%'+person_thai_name+'%'+person_thai_surname+'%')) ";
            }

            if (ViewState["loan_doc_list"].ToString().Length > 0)
            {
                strCriteria = strCriteria + "  And  loan_doc not in (" + ViewState["loan_doc_list"] + ") ";                
            }

            try
            {
                dt = objEfLoan.SP_LOAN_HEAD_SEL(strCriteria);

                //if (dt.Rows.Count == 1)
                //{
                //    string strloan_id = dt.Rows[0]["loan_id"].ToString();
                //    strloan_doc = dt.Rows[0]["loan_doc"].ToString();
                //    strloan_reason = dt.Rows[0]["loan_reason"].ToString();
                //    string strloan_date = cCommon.CheckDate(dt.Rows[0]["loan_date"].ToString());
                //    string strloan_req = Helper.CDbl(dt.Rows[0]["loan_req"].ToString()).ToString("N2");


                //    if (!ViewState["show"].ToString().Equals("1"))
                //    {
                //        strScript = "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl1"] + "').value='" + strloan_id + "';\n " +
                //                        "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl2"] + "').value='" + strloan_doc + "';\n" +
                //                        "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl3"] + "').value='" + strloan_reason + "';\n" +
                //                        "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl4"] + "').value='" + strloan_date + "';\n" +
                //                        "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl5"] + "').value='" + strloan_req + "';\n" +
                //                        "ClosePopUp('" + ViewState["show"] + "');";
                //        if (ViewState["from"].ToString() == "open_control")
                //        {
                //            strScript += "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].__doPostBack('ctl00$ContentPlaceHolder1$lbkGetOpen','');";
                //        }
                //    }
                //    else
                //    {
                //        strScript = "window.parent.document.getElementById('" + ViewState["ctrl1"] + "').value='" + strloan_id + "';\n " +
                //                        "window.parent.document.getElementById('" + ViewState["ctrl2"] + "').value='" + strloan_doc + "';\n" +
                //                        "window.parent.document.getElementById('" + ViewState["ctrl3"] + "').value='" + strloan_reason + "';\n" +
                //                        "window.parent.document.getElementById('" + ViewState["ctrl4"] + "').value='" + strloan_date + "';\n" +
                //                        "window.parent.document.getElementById('" + ViewState["ctrl5"] + "').value='" + strloan_req + "';\n" +
                //                        "ClosePopUp('" + ViewState["show"] + "');";
                //    }
                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "close", strScript, true);
                //}
                //else
                //{
                //    dt.DefaultView.Sort = ViewState["sort"] + " " + ViewState["direction"];
                //    GridView1.DataSource = dt;
                //    GridView1.DataBind();
                //}


                dt.DefaultView.Sort = ViewState["sort"] + " " + ViewState["direction"];
                GridView1.DataSource = dt;
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                objEfLoan.Dispose();
            }
        }

        #endregion

        protected void imgFind_Click(object sender, ImageClickEventArgs e)
        {
            BindGridView();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.Header))
            {
                for (int iCol = 0; iCol < e.Row.Cells.Count; iCol++)
                {
                    e.Row.Cells[iCol].Attributes.Add("class", "table_h");
                    e.Row.Cells[iCol].Wrap = false;
                }
            }
            else if (e.Row.RowType.Equals(DataControlRowType.DataRow) || e.Row.RowState.Equals(DataControlRowState.Alternate))
            {
                #region Set datagrid row color
                string strEvenColor, strOddColor, strMouseOverColor;
                strEvenColor = ((DataSet)Application["xmlconfig"]).Tables["colorDataGridRow"].Rows[0]["Even"].ToString();
                strOddColor = ((DataSet)Application["xmlconfig"]).Tables["colorDataGridRow"].Rows[0]["Odd"].ToString();
                strMouseOverColor = ((DataSet)Application["xmlconfig"]).Tables["colorDataGridRow"].Rows[0]["MouseOver"].ToString();

                e.Row.Style.Add("valign", "top");
                e.Row.Style.Add("cursor", "hand");
                e.Row.Attributes.Add("onMouseOver", "this.style.backgroundColor='" + strMouseOverColor + "'");

                if (e.Row.RowState.Equals(DataControlRowState.Alternate))
                {
                    e.Row.Attributes.Add("bgcolor", strOddColor);
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor='" + strOddColor + "'");
                }
                else
                {
                    e.Row.Attributes.Add("bgcolor", strEvenColor);
                    e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor='" + strEvenColor + "'");
                }
                #endregion

                Label lblNo = (Label)e.Row.FindControl("lblNo");
                int nNo = (GridView1.PageSize * GridView1.PageIndex) + e.Row.RowIndex + 1;
                lblNo.Text = nNo.ToString();
                var dv = (DataRowView)e.Row.DataItem;
                var lblloan_doc = (LinkButton)e.Row.FindControl("lblloan_doc");
                string strloan_id = dv["loan_id"].ToString();
                string strloan_doc = dv["loan_doc"].ToString();
                string strloan_reason = dv["loan_reason"].ToString();
                string strloan_date = cCommon.CheckDate(dv["loan_date"].ToString());
                string strloan_req = Helper.CDbl(dv["loan_req"].ToString()).ToString("N2");
                string strScript = string.Empty;

                if (!ViewState["show"].ToString().Equals("1"))
                {

                    strScript = "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].document.getElementById('" + ViewState["ctrl1"] + "').value='" + strloan_id +
                                "';\n " +
                                "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].document.getElementById('" + ViewState["ctrl2"] + "').value='" + strloan_doc +
                                "';\n" +
                                "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].document.getElementById('" + ViewState["ctrl3"] + "').innerHTML='" + strloan_reason +
                                "';\n" +
                                "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].document.getElementById('" + ViewState["ctrl4"] + "').innerHTML='" + strloan_date +
                                "';\n" +
                                "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].document.getElementById('" + ViewState["ctrl5"] + "').innerHTML='" + strloan_req +
                                "';\n" +
                                "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].document.getElementById('" + ViewState["ctrl3"].ToString().Replace("lbl", "hdd") +
                                "').value='" + strloan_reason +
                                "';\n" +
                                "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].document.getElementById('" + ViewState["ctrl4"].ToString().Replace("txt", "hdd") +
                                "').value='" + strloan_date +
                                "';\n" +
                                "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].document.getElementById('" + ViewState["ctrl5"].ToString().Replace("txt", "hdd") +
                                "').value='" + strloan_req +
                                "';window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) +
                                "'].calTotalLoan();";
                                


                    strScript += "ClosePopUp('" + ViewState["show"] + "');";

                    lblloan_doc.Attributes.Add("onclick", strScript);
                }
                else
                {
                    strScript = "window.parent.document.getElementById('" + ViewState["ctrl1"] + "').value='" + strloan_id + "';\n " +
                                          "window.parent.document.getElementById('" + ViewState["ctrl2"] + "').value='" + strloan_doc + "';\n" +
                                          "window.parent.document.getElementById('" + ViewState["ctrl3"] + "').innerHTML='" + strloan_reason + "';\n" +
                                          "window.parent.document.getElementById('" + ViewState["ctrl4"] + "').innerHTML='" + strloan_date + "';\n" +
                                          "window.parent.document.getElementById('" + ViewState["ctrl5"] + "').innerHTML='" + strloan_req + "';\n" +
                                          "window.parent.document.getElementById('" + ViewState["ctrl3"].ToString().Replace("lbl", "hdd") + "').innerHTML='" + strloan_reason + "';\n" +
                                          "window.parent.document.getElementById('" + ViewState["ctrl4"].ToString().Replace("txt", "hdd") + "').innerHTML='" + strloan_date + "';\n" +
                                          "window.parent.document.getElementById('" + ViewState["ctrl5"].ToString().Replace("txt", "hdd") + "').innerHTML='" + strloan_req + "';\n" +
                                          "window.parent.calTotalLoan();ClosePopUp('" + ViewState["show"] + "');";
                    lblloan_doc.Attributes.Add("onclick", strScript);

                }


            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.Header))
            {
                #region Create Item Header
                bool bSort = false;
                int i = 0;
                for (i = 0; i < GridView1.Columns.Count; i++)
                {
                    if (ViewState["sort"].Equals(GridView1.Columns[i].SortExpression))
                    {
                        bSort = true;
                        break;
                    }
                }
                if (bSort)
                {
                    foreach (System.Web.UI.Control c in e.Row.Controls[i].Controls)
                    {
                        if (c.GetType().ToString().Equals("System.Web.UI.WebControls.DataControlLinkButton"))
                        {
                            if (ViewState["direction"].Equals("ASC"))
                            {
                                ((LinkButton)c).Text += "<img border=0 src='" + ((DataSet)Application["xmlconfig"]).Tables["imgAsc"].Rows[0]["img"].ToString() + "'>";
                            }
                            else
                            {
                                ((LinkButton)c).Text += "<img border=0 src='" + ((DataSet)Application["xmlconfig"]).Tables["imgDesc"].Rows[0]["img"].ToString() + "'>";
                            }
                        }
                    }
                }
                #endregion
            }
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                if (ViewState["sort"].ToString().Equals(e.SortExpression.ToString()))
                {
                    if (ViewState["direction"].Equals("DESC"))
                        ViewState["direction"] = "ASC";
                    else
                        ViewState["direction"] = "DESC";
                }
                else
                {
                    ViewState["sort"] = e.SortExpression;
                    ViewState["direction"] = "ASC";
                }
                BindGridView();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }


    }
}
