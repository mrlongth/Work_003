<%@ Page Language="C#" MasterPageFile="~/Site_list.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="loan_list.aspx.cs" Inherits="myEFrom.App_Control.loan.loan_list"
    Title="�ʴ��������ѭ�ҡ������Թ" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagPrefix="cc1" Namespace="Aware.WebControls" Assembly="Aware.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="1" cellspacing="1" style="width: 100%">
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage4">�է�����ҳ :</asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboYear" AutoPostBack="True"
                    OnSelectedIndexChanged="cboYear_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="text-align: right; width: 160px;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage2">�Ţ����ѭ�� : </asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox runat="server" CssClass="textbox" Width="80px" ID="txtloan_doc"></asp:TextBox>
                <asp:Label ID="lblError" runat="server" CssClass="label_error"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 150px;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage18">ʶҹ��ѭ�� : </asp:Label>
            </td>
            <td style="text-align: left; white-space: nowrap;">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboLoanStatus">
                    <asp:ListItem Value="">--- ���͡������ ---</asp:ListItem>
                    <asp:ListItem Value="W">��¡���ѧ�������ó�</asp:ListItem>
                    <asp:ListItem Value="P">��͹��ѵ�</asp:ListItem>
                    <asp:ListItem Value="A">͹��ѵ�</asp:ListItem>
                    <asp:ListItem Value="S">���Ф׹�ҧ��ǹ</asp:ListItem>
                    <asp:ListItem Value="F">���Ф׹�������</asp:ListItem>
                    <asp:ListItem Value="N">���͹��ѵ�</asp:ListItem>
                    <asp:ListItem Value="X">͹��ѵԺҧ��ǹ</asp:ListItem>
                    <asp:ListItem Value="C">¡��ԡ��¡��</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="text-align: right;">
                <asp:Label runat="server" ID="lblPage9" CssClass="label_h">������� :</asp:Label>
            </td>
            <td colspan="2" style="white-space: nowrap;">
                <asp:TextBox runat="server" CssClass="textbox" Width="80px" ID="txtperson_code" MaxLength="20"></asp:TextBox>
                &nbsp;<asp:ImageButton runat="server" ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif"
                    ID="imgList_person"></asp:ImageButton>
                <asp:ImageButton runat="server" CausesValidation="False" ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif"
                    ID="imgClear_person"></asp:ImageButton>
                &nbsp;<asp:TextBox runat="server" CssClass="textbox" Width="230px" ID="txtperson_name"
                    MaxLength="100"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 150px;">
                <asp:Label runat="server" CssClass="label_h" ID="Label1">������������ҳ : </asp:Label>
            </td>
            <td style="text-align: left; white-space: nowrap;">
                <asp:DropDownList runat="server" AutoPostBack="True" CssClass="textbox" ID="cboBudget_type"
                    OnSelectedIndexChanged="cboBudget_type_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="text-align: right;">&nbsp;
                <asp:Label runat="server" ID="Label2" CssClass="label_h">��������´�ѭ�� :</asp:Label>
            </td>
            <td colspan="2" style="white-space: nowrap;">
                <asp:TextBox runat="server" CssClass="textbox" Width="300px" ID="txtloan_reason"
                    MaxLength="200"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage7">�ѧ�Ѵ :
                </asp:Label>
            </td>
            <td style="width: 1%;">
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboDirector" AutoPostBack="True"
                    OnSelectedIndexChanged="cboDirector_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage8">˹��§ҹ :
                </asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" CssClass="textbox" ID="cboUnit" AutoPostBack="True"
                    OnSelectedIndexChanged="cboUnit_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td rowspan="2" style="width: 200px; text-align: right;">
                <asp:ImageButton runat="server" AlternateText="���Ң�����" ImageUrl="~/images/button/Search.png"
                    ID="imgFind" OnClick="imgFind_Click"></asp:ImageButton>
                <asp:ImageButton runat="server" AlternateText="����������" ImageUrl="~/images/button/Save.png"
                    ID="imgNew"></asp:ImageButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage19">������ѹ��� :
                </asp:Label>
            </td>
            <td style="width: 1%;">
                <asp:TextBox runat="server" CssClass="textbox" Width="80px" ID="txtfrom_date"></asp:TextBox>
            </td>
            <td style="text-align: right;">
                <asp:Label runat="server" CssClass="label_h" ID="lblPage20">�֧�ѹ��� :
                </asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" CssClass="textbox" Width="80px" ID="txtto_date"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:GridView runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
        CellPadding="2" EmptyDataText="��辺�����ŷ���ͧ��ä���" ShowFooter="True"
        BorderWidth="1px" CssClass="stGrid" Font-Bold="False" Font-Size="10pt" Width="100%"
        ID="GridView1" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated"
        OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting"
        OnSorting="GridView1_Sorting" OnRowCommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="imgView" runat="server" CausesValidation="False" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="2%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server"> </asp:Label>
                    <asp:HiddenField ID="hddloan_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.loan_id") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="True" Width="2%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�Ţ����ѭ��" SortExpression="loan_doc">
                <ItemStyle HorizontalAlign="Left" Wrap="True" Width="5%"></ItemStyle>
                <ItemTemplate>
                    <asp:Label ID="lblloan_doc" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.loan_doc") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�ѹ���">
                <ItemTemplate>
                    <cc1:AwLabelDateTime ID="txtloan_date" runat="server" Value='<% # DataBinder.Eval(Container, "DataItem.loan_date")%>'
                        DateFormat="dd/MM/yyyy">
                    &nbsp;
                    </cc1:AwLabelDateTime>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="True" />
            </asp:TemplateField>
            
                
              <asp:TemplateField HeaderText="�ѹ����ҹ��¡��">
                <ItemTemplate>
                    <cc1:AwLabelDateTime ID="txtprocess_date" runat="server" Value='<% # DataBinder.Eval(Container, "DataItem.d_process_date") %>'
                        DateFormat="dd/MM/yyyy HH:mm">
                    &nbsp;
                    </cc1:AwLabelDateTime>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="True" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="�������͡���" SortExpression="ef_doctype_name">
                <ItemStyle HorizontalAlign="Left" Wrap="True" Width="5%"></ItemStyle>
                <ItemTemplate>
                    <asp:Label ID="lblef_doctype_name" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ef_doctype_name") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="��¡���ѭ�ҡ������Թ" SortExpression="loan_title"
                Visible="true">
                <ItemStyle HorizontalAlign="Left" Wrap="True" Width="20%"></ItemStyle>
                <ItemTemplate>
                    <div style="max-width: 450px; word-wrap: break-word;">
                        <asp:Label ID="lblloan_reason" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.loan_reason")%>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="�ӹǹ�Թ�����" SortExpression="loan_approve" Visible="true">
                <ItemStyle HorizontalAlign="Right" Wrap="True" Width="80px"></ItemStyle>
                <ItemTemplate>
                    <cc1:AwNumeric ID="txtloan_approve" runat="server" Width="80px" LeadZero="Show" DisplayMode="View"
                        Value='<% # DataBinder.Eval(Container, "DataItem.loan_approve") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="��â�͹��ѵ��ԡ" Visible="true">
                <ItemStyle HorizontalAlign="Left" Wrap="True" Width="160px"></ItemStyle>
                <ItemTemplate>
                    
                    <asp:Panel ID="pnlFormOpenShow" runat="server">
                        <asp:Repeater ID="RepeaterOpen" runat="server" >
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td style="width: 80px;">
                                            <asp:Label Width="80" ID="lblopen_doc" Font-Underline="true"  runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.open_doc")  %>'></asp:Label> 
                                        </td>
                                        <td style="width: 80px; text-align:right;">
                                            <cc1:AwNumeric ID="txtopen_amount" runat="server" Width="80px" LeadZero="Show" DisplayMode="View"
                                                Value='<% # DataBinder.Eval(Container, "DataItem.open_amount") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                   
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="����ѭ�ҡ������Թ" SortExpression="person_thai_name"
                Visible="true">
                <ItemStyle HorizontalAlign="Left" Wrap="True" Width="15%"></ItemStyle>
                <ItemTemplate>
                    <asp:Label ID="lblperson_thai_name" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.title_name") + "" + DataBinder.Eval(Container, "DataItem.person_thai_name") + " " + DataBinder.Eval(Container, "DataItem.person_thai_surname")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="���/�ѧ�Ѵ (˹��§ҹ)" SortExpression="director_name" Visible="false">
                <ItemStyle HorizontalAlign="Left" Wrap="True" Width="15%"></ItemStyle>
                <ItemTemplate>
                    <asp:Label ID="lbldirector_code" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.director_code")%>'
                        Visible="false"></asp:Label>
                    <asp:Label ID="lbldirector_name" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.director_name") + " (" + DataBinder.Eval(Container, "DataItem.unit_name") + ")"%>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ʶҹС��͹��ѵ�" Visible="true">
                <ItemStyle HorizontalAlign="Left" Wrap="False" Width="300px"></ItemStyle>
                <ItemTemplate>
                    <asp:Panel ID="plnCollapseDetail" runat="server" class="formlabel" Style="clear: both; cursor: pointer;">
                        <asp:LinkButton ID="lnkCollapseDetail" runat="server" Style="text-decoration: none;">
                            <asp:Label ID="lblLoan_status" runat="server" Width="210"></asp:Label>
                            <asp:ImageButton ID="imgBtnCollapse" runat="server" ImageEnableUrl="~/images/button/collapse.jpg" />
                        </asp:LinkButton>
                    </asp:Panel>
                    <asp:Panel ID="pnlFormShow" runat="server">
                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td style="width: 120px; border: solid 1px;">
                                            <asp:Label Width="120" ID="lblLoan_person_name" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.person_thai_name") + "  " + DataBinder.Eval(Container, "DataItem.person_thai_surname")%>'></asp:Label>
                                        </td>
                                        <td style="width: 50px;">-
                                            <asp:Label Width="50" ID="lblLoan_status" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 30px;">
                                            <asp:ImageButton ID="btnViewComment" runat="server" ImageUrl="~/images/chat.png"
                                                ToolTip="��ԡ���ʹ٢�ͤԴ����������" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <ajaxtoolkit:CollapsiblePanelExtender ID='cpePanel' BehaviorID='<%# "cpePanel"+ DataBinder.Eval(Container, "RowIndex")  %>'
                        runat="server" TargetControlID="pnlFormShow" ImageControlID='imgBtnCollapse'
                        Collapsed="true" CollapseControlID="plnCollapseDetail" ExpandControlID="plnCollapseDetail"
                        ExpandedImage="~/images/button/collapse.jpg" CollapsedImage="~/images/button/expand.jpg"
                        SuppressPostBack="true">
                    </ajaxtoolkit:CollapsiblePanelExtender>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="imgPass" runat="server" CausesValidation="False" CommandName="Pass"
                        CommandArgument="<%# Container.DisplayIndex + 1 %>" Visible="false" />
                    <asp:ImageButton ID="imgPrint" runat="server" CausesValidation="False" CommandName="Print" />
                    <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Edit" />
                    <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" CommandName="Delete" />
                    <asp:ImageButton ID="imgRestore" runat="server" CausesValidation="False" CommandName="Restore"
                        CommandArgument="<%# Container.DisplayIndex + 1 %>" Visible="false" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="8%"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
        <HeaderStyle HorizontalAlign="Center" CssClass="stGridHeader" Font-Bold="True"></HeaderStyle>
        <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/images/next.gif" NextPageText="Next &amp;gt;&amp;gt;"
            Position="Top" PreviousPageImageUrl="~/images/prev.gif" PreviousPageText="&amp;lt;&amp;lt; Previous"></PagerSettings>
        <PagerStyle HorizontalAlign="Center" Wrap="True" BackColor="Gainsboro" ForeColor="#8C4510"></PagerStyle>
    </asp:GridView>
    <input id="txthpage" type="hidden" name="txthpage" runat="server">
    <input id="txthTotalRecord" type="hidden" name="txthTotalRecord" runat="server">
    
    
</asp:Content>
