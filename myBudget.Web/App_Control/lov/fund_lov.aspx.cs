﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Threading;
using System.Text;
using myBudget.DLL;

namespace myBudget.Web.App_Control.lov
{
    public partial class fund_lov : PageBase
    {

        #region private data
        private string strConn = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];
        private bool[] blnAccessRight = new bool[5] { false, false, false, false, false };
        private string strPrefixCtr = "ctl00$ASPxRoundPanel1$ASPxRoundPanel2$ContentPlaceHolder1$";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            // Thread.Sleep(2000);
            if (!IsPostBack)
            {
                imgFind.Attributes.Add("onMouseOver", "src='../../images/button/Search2.png'");
                imgFind.Attributes.Add("onMouseOut", "src='../../images/button/Search.png'");

                Session["menulov_name"] = "ค้นหาข้อมูลกองทุน";
                if (Request.QueryString["year"] != null)
                {
                    ViewState["fund_year"] = Request.QueryString["year"].ToString();
                    txtfund_year.Text = ViewState["fund_year"].ToString();
                    txtfund_year.CssClass = "textboxdis";
                    txtfund_year.ReadOnly = true;
                }

                if (Request.QueryString["fund_code"] != null)
                {
                    ViewState["fund_code"] = Request.QueryString["fund_code"].ToString();
                    txtfund_code.Text = ViewState["fund_code"].ToString();
                }
                else
                {
                    ViewState["fund_code"] = string.Empty;
                    txtfund_code.Text = string.Empty;
                }
                if (Request.QueryString["fund_name"] != null)
                {
                    ViewState["fund_name"] = Request.QueryString["fund_name"].ToString();
                    txtfund_name.Text = ViewState["fund_name"].ToString();
                }
                else
                {
                    ViewState["fund_name"] = string.Empty;
                    txtfund_name.Text = string.Empty;
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
                if (Request.QueryString["show"] != null)
                {
                    ViewState["show"] = Request.QueryString["show"].ToString();
                }
                else
                {
                    ViewState["show"] = "1";
                }
                ViewState["sort"] = "fund_code";
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
            cFund ofund = new cFund();
            DataSet ds = new DataSet();
            string strMessage = string.Empty;
            string strCriteria = string.Empty;
            string strfund_code = string.Empty;
            string strfund_name = string.Empty;
            string strScript = string.Empty;
            string strfund_year = string.Empty;
            strfund_code = txtfund_code.Text.Replace("'", "''").Trim();
            strfund_name = txtfund_name.Text.Replace("'", "''").Trim();
            strfund_year = txtfund_year.Text.Replace("'", "''").Trim(); ;
            if (!strfund_code.Equals(""))
            {
                strCriteria = strCriteria + "  And  (fund_code like '%" + strfund_code + "%') ";
            }
            if (!strfund_name.Equals(""))
            {
                strCriteria = strCriteria + "  And  (fund_name like '%" + strfund_name + "%')";
            }
            if (!strfund_year.Equals(""))
            {
                strCriteria = strCriteria + "  And  (fund_year = '" + strfund_year + "') ";
            }
            strCriteria = strCriteria + "  And  (c_active ='Y') ";
            try
            {
                if (ofund.SP_SEL_FUND(strCriteria, ref ds, ref strMessage))
                {
                    if (ds.Tables[0].Rows.Count == 1)
                    {
                        strfund_code = ds.Tables[0].Rows[0]["fund_code"].ToString();
                        strfund_name = ds.Tables[0].Rows[0]["fund_name"].ToString();
                        if (!ViewState["show"].ToString().Equals("1"))
                        {
                            strScript = "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl1"].ToString() + "').value='" + strfund_code + "';\n " +
                                                "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl2"].ToString() + "').value='" + strfund_name + "';\n" +
                                                "ClosePopUp('" + ViewState["show"].ToString() + "');";
                        }
                        else
                        {
                            strScript = "window.parent.document.forms[0]." + ViewState["ctrl1"].ToString() + ".value='" + strfund_code + "';\n " +
                                                "window.parent.document.forms[0]." + ViewState["ctrl2"].ToString() + ".value='" + strfund_name + "';\n" +
                                                "ClosePopUp('" + ViewState["show"].ToString() + "');";
                        }
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "close", strScript, true);
                    }
                    else
                    {
                        ds.Tables[0].DefaultView.Sort = ViewState["sort"] + " " + ViewState["direction"];
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                    }
                }
                else
                {
                    lblError.Text = strMessage;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
            finally
            {
                ofund.Dispose();
                ds.Dispose();
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
                Label lblfund_code = (Label)e.Row.FindControl("lblfund_code");
                Label lblfund_name = (Label)e.Row.FindControl("lblfund_name");
                if (!ViewState["show"].ToString().Equals("1"))
                {
                    lblfund_code.Text = "<a href=\"\" onclick=\"" +
                                        "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl1"].ToString() + "').value='" + lblfund_code.Text + "';\n " +
                                        "window.parent.frames['iframeShow" + (int.Parse(ViewState["show"].ToString()) - 1) + "'].document.getElementById('" + ViewState["ctrl2"].ToString() + "').value='" + lblfund_name.Text + "';\n" +
                                        "ClosePopUp('" + ViewState["show"].ToString() + "');" +
                                        "return false;\" >" + lblfund_code.Text + "</a>";
                }
                else
                {
                    lblfund_code.Text = "<a href=\"\" onclick=\"" +
                                        "window.parent.document.getElementById('" + ViewState["ctrl1"].ToString() + "').value='" + lblfund_code.Text + "';\n " +
                                        "window.parent.document.getElementById('" + ViewState["ctrl2"].ToString() + "').value='" + lblfund_name.Text + "';\n" +
                                        "ClosePopUp('" + ViewState["show"].ToString() + "');" +
                                        "return false;\" >" + lblfund_code.Text + "</a>";
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
