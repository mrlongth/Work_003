<%@ Page Language="C#" MasterPageFile="~/Site_popup.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="person_control.aspx.cs" Inherits="myBudget.Web.App_Control.person.person_control" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" language="javascript">
        function RunValidationsAndSetActiveTab() {
            if (typeof (Page_Validators) == "undefined") return;
            try {
                var noOfValidators = Page_Validators.length;
                for (var validatorIndex = 0; validatorIndex < noOfValidators; validatorIndex++) {
                    var validator = Page_Validators[validatorIndex];
                    ValidatorValidate(validator);
                    if (!validator.isvalid) {
                        var tabPanel = validator.parentElement.parentElement.parentElement.parentElement.parentElement.control;
                        var tabContainer = tabPanel.get_owner();
                        tabContainer.set_activeTabIndex(tabPanel.get_tabIndex());
                        break;
                    }
                }
            }
            catch (Error) {
                alert("Failed");
            }
        }

        function RetrieveMembertype(res) {
            var retVal = res.value;
            var cbomember_type = document.getElementById("ctl00_ContentPlaceHolder1_TabContainer1_TabPanel2_cboMember_type");
            if (retVal != null && retVal.Rows.length > 0) {
                var Len = retVal.Rows.length;
                // Reset 
                for (i = cbomember_type.options.length - 1; i >= 0; i--) {
                    cbomember_type.remove(i);
                }
                // Add  Data
                var optn = document.createElement("OPTION");
                optn.text = "N";
                optn.value = '';
                cbomember_type.options.add(optn);
                for (i = 0; i < Len; i++) {
                    var opt = document.createElement("OPTION");
                    opt.text = retVal.Rows[i].member_type_name;
                    opt.value = retVal.Rows[i].member_type_code;
                    opt.setAttribute("wv", retVal.Rows[i].member_type_code);
                    cbomember_type.add(opt);
                }
            }
            else {
                // Reset 
                for (i = cbomember_type.options.length - 1; i >= 0; i--) {
                    cbomember_type.remove(i);
                }
                var optn = document.createElement("OPTION");
                optn.text = "N";
                optn.value = '';
                cbomember_type.options.add(optn);
            }
        }

        function changeMembertype(e, gbk, gsj, sos) {
            myBudget.Web.App_Control.person.person_control.GetDataMemberType(e.options[e.selectedIndex].value, gbk, gsj, sos, RetrieveMembertype);
        } 
    </script>

    <table border="0" cellpadding="1" cellspacing="2" style="width: 100%">
        <tr align="center">
            <td>
                <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" Height="450px"
                    BorderWidth="0px" Style="text-align: left">
                    <ajaxtoolkit:TabPanel runat="server" HeaderText="�����Ż���ѵԺؤ��ҡ�" ID="TabPanel1">
                        <HeaderTemplate>
                            ����ѵԺؤ�š�
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                                <tr>
                                    <td align="left" nowrap style="text-align: right" valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" style="width: 0%">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" nowrap style="text-align: right" valign="middle">
                                        <asp:Label ID="lblLastUpdatedBy" runat="server" CssClass="label_hbk">Last Updated By :</asp:Label>
                                    </td>
                                    <td align="left" width="15%">
                                        <asp:TextBox ID="txtUpdatedBy" runat="server" CssClass="textboxdis" ReadOnly="True"
                                            Width="148px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" nowrap style="text-align: right" valign="middle">
                                        <asp:Label ID="lblLastUpdatedDate" runat="server" CssClass="label_hbk">Last Updated Date :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtUpdatedDate" runat="server" CssClass="textboxdis" ReadOnly="True"
                                            Width="148px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle" width="10%">
                                        <asp:Label ID="Label21" runat="server" CssClass="label_hbk">���ʺؤ��ҡ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" width="40%">
                                        <asp:TextBox ID="txtperson_code" runat="server" CssClass="textboxdis" Width="120px"></asp:TextBox>
                                    </td>
                                    <td align="left" nowrap valign="middle" width="20%">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle">
                                        <asp:Label ID="Label71" runat="server" CssClass="label_error">*</asp:Label><asp:Label
                                            ID="Label16" runat="server" CssClass="label_hbk">�ӹ�˹�Ҫ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:DropDownList ID="cboTitle" runat="server" CssClass="textbox">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="cboTitle"
                                            Display="None" ErrorMessage="��س����͡�ӹ�˹�Ҫ���" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator><asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtperson_thai_name"
                                                Display="None" ErrorMessage="��سһ�͹����������" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                    <td align="left" nowrap rowspan="9" style="text-align: center" valign="middle">
                                        <asp:Image ID="imgPerson" runat="server" BorderStyle="Solid" BorderWidth="1px" Height="200px"
                                            ImageUrl="~/person_pic/image_n_a.jpg" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label73" runat="server" CssClass="label_error">*</asp:Label><asp:Label
                                            ID="Label14" runat="server" CssClass="label_hbk">���������� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_thai_name" runat="server" CssClass="textbox" Width="400px"
                                            MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label15" runat="server" CssClass="label_hbk">���ʡ�������� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_thai_surname" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label17" runat="server" CssClass="label_hbk">���������ѧ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_eng_name" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label18" runat="server" CssClass="label_hbk">���ʡ�������ѧ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_eng_surname" runat="server" CssClass="textbox" Width="400px"
                                            MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label72" runat="server" CssClass="label_error">*</asp:Label><asp:Label
                                            ID="Label20" runat="server" CssClass="label_hbk">�Ţ���ѵû�ЪҪ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_id" runat="server" CssClass="textbox" Width="200px" MaxLength="13"></asp:TextBox><ajaxtoolkit:FilteredTextBoxExtender
                                            ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtperson_id" FilterType="Numbers"
                                            Enabled="True" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtperson_id"
                                            Display="None" ErrorMessage="��سһ�͹�Ţ���ѵû�ЪҪ�" ValidationGroup="A"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label19" runat="server" CssClass="label_hbk">������� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_nickname" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label63" runat="server" CssClass="label_hbk">�ٻ�ؤ��ҡ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap>
                                        <asp:TextBox ID="txtperson_pic" runat="server" CssClass="textbox" Width="400px"></asp:TextBox><asp:ImageButton
                                            ID="imgperson_pic" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/images/picture.png" /><asp:ImageButton
                                                ID="imgClear_person_pic" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                                                ImageUrl="../../images/controls/erase.gif" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label76" runat="server" CssClass="label_hbk">ʶҹ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <font face="Tahoma">
                                            <asp:CheckBox ID="chkStatus" runat="server" Text="����" />
                                        </font>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="height: 15px">
                                    </td>
                                    <td align="left" nowrap valign="middle" style="height: 15px">
                                    </td>
                                    <td style="height: 15px">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" colspan="2" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" colspan="3">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="�����š�÷ӧҹ">
                        <HeaderTemplate>
                            ��÷ӧҹ
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                                <tr align="left">
                                    <td nowrap valign="middle" align="right">
                                        <asp:Label ID="Label65" runat="server" CssClass="label_error">*</asp:Label>
                                        <asp:Label ID="Label49" runat="server" CssClass="label_hbk">���˹觻Ѩ�غѹ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtposition_code" runat="server" CssClass="textbox" MaxLength="5"
                                            Width="80px"></asp:TextBox>
                                        &nbsp;<asp:ImageButton ID="imgList_position" runat="server" CausesValidation="False"
                                            ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                        <asp:ImageButton ID="imgClear_position" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                                            ImageUrl="../../images/controls/erase.gif" />
                                        &nbsp;<asp:TextBox ID="txtposition_name" runat="server" CssClass="textboxdis" MaxLength="100"
                                            Width="200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtposition_code"
                                            Display="None" ErrorMessage="��سһ�͹���˹觻Ѩ�غѹ" SetFocusOnError="True"
                                            ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                    <td nowrap style="text-align: right" width="10%">
                                        <asp:Label ID="Label77" runat="server" CssClass="label_hbk">���������˹� :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txttype_position_code" runat="server" CssClass="textbox" MaxLength="5"
                                            Width="80px"></asp:TextBox>
                                        &nbsp;<asp:ImageButton ID="imgList_type" runat="server" CausesValidation="False"
                                            ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                        <asp:ImageButton ID="imgClear_type" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                                            ImageUrl="../../images/controls/erase.gif" />
                                        &nbsp;<asp:TextBox ID="txttype_position_name" runat="server" CssClass="textboxdis"
                                            MaxLength="100" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label3" runat="server" CssClass="label_hbk">�дѺ���˹� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_level" runat="server" CssClass="textbox" MaxLength="5"
                                            Width="80px"></asp:TextBox>
                                        &nbsp;<asp:ImageButton ID="imgList_level" runat="server" CausesValidation="False"
                                            ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                        <asp:ImageButton ID="imgClear_level" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                                            ImageUrl="../../images/controls/erase.gif" />
                                        &nbsp;<asp:TextBox ID="txtlevel_position_name" runat="server" CssClass="textboxdis"
                                            MaxLength="100" Width="200px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right" width="10%">
                                        <asp:Label ID="Label6" runat="server" CssClass="label_hbk">�Ţ�����˹� :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtperson_postionno" runat="server" CssClass="textbox" Width="130px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td nowrap valign="middle" style="text-align: right">
                                        <asp:Label ID="Label66" runat="server" CssClass="label_error">*</asp:Label>
                                        <asp:Label ID="Label8" runat="server" CssClass="label_hbk">�ҢҸ�Ҥ�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="3" style="text-align: left">
                                        <asp:TextBox ID="txtbranch_code" runat="server" CssClass="textbox" MaxLength="6"
                                            Width="80px"></asp:TextBox>
                                        &nbsp;<asp:ImageButton ID="imgList_branch" runat="server" CausesValidation="False"
                                            ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                        <asp:ImageButton ID="imgClear_branch" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                                            ImageUrl="../../images/controls/erase.gif" />
                                        &nbsp;<asp:TextBox ID="txtbranch_name" runat="server" CssClass="textboxdis" MaxLength="100"
                                            Width="200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtbranch_code"
                                            Display="None" ErrorMessage="��سһ�͹�ҢҸ�Ҥ��" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td nowrap valign="middle" align="right">
                                        <asp:Label ID="Label22" runat="server" CssClass="label_hbk">��Ҥ�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbank_name" runat="server" CssClass="textboxdis" Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label68" runat="server" CssClass="label_error">*</asp:Label>
                                        <asp:Label ID="Label38" runat="server" CssClass="label_hbk">�Ţ���ѭ�� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtbank_no" runat="server" CssClass="textbox" MaxLength="20" Width="130px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label78" runat="server" CssClass="label_hbk">�ҢҸ�Ҥ��(ô.) :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbranch_code_2" runat="server" CssClass="textbox" MaxLength="6"
                                            Width="80px"></asp:TextBox>
                                        &nbsp;<asp:ImageButton ID="imgList_branch_2" runat="server" CausesValidation="False"
                                            ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                        <asp:ImageButton ID="imgClear_branch_2" runat="server" CausesValidation="False" ImageAlign="AbsBottom"
                                            ImageUrl="../../images/controls/erase.gif" />
                                        &nbsp;<asp:TextBox ID="txtbranch_name_2" runat="server" CssClass="textboxdis" MaxLength="100"
                                            Width="200px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label80" runat="server" CssClass="label_hbk">�Ţ���ѭ��(ô.) :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtbank_no_2" runat="server" CssClass="textbox" MaxLength="20" Width="130px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label79" runat="server" CssClass="label_hbk">��Ҥ��(ô.) :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbank_name_2" runat="server" CssClass="textboxdis" Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label67" runat="server" CssClass="label_error">*</asp:Label>
                                        <asp:Label ID="Label41" runat="server" CssClass="label_hbk">�Թ��͹�Ѩ�غѹ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="" valign="middle">
                                        <asp:TextBox ID="txtperson_salaly" runat="server" CssClass="numberbox" Width="130px">0.00</asp:TextBox>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                            Enabled="True" FilterType="Custom, Numbers" TargetControlID="txtperson_salaly"
                                            ValidChars=".">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtperson_salaly"
                                            Display="None" ErrorMessage="��سһ�͹�Թ��͹�Ѩ�غѹ" SetFocusOnError="True"
                                            ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label69" runat="server" CssClass="label_error">*</asp:Label>
                                        <asp:Label ID="Label50" runat="server" CssClass="label_hbk">������ؤ��ҡ� :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cboPerson_group" runat="server" CssClass="textbox" AutoPostBack="True" OnSelectedIndexChanged="cboPerson_group_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cboPerson_group"
                                            Display="None" ErrorMessage="��س����͡������ؤ��ҡ�" SetFocusOnError="True"
                                            ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label43" runat="server" CssClass="label_hbk">�ѹ����è� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="vertical-align: middle">
                                        <asp:TextBox ID="txtperson_start" runat="server" CssClass="textbox" ReadOnly="True"
                                            Width="130px"></asp:TextBox>
                                        <ajaxtoolkit:CalendarExtender ID="txtperson_start_CalendarExtender" runat="server"
                                            Enabled="True" PopupButtonID="imgperson_start" TargetControlID="txtperson_start">
                                        </ajaxtoolkit:CalendarExtender>
                                        <asp:ImageButton ID="imgperson_start" runat="server" AlternateText="Click to show calendar"
                                            ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label44" runat="server" CssClass="label_hbk">�ѹ������³ :</asp:Label>
                                    </td>
                                    <td align="left" style="vertical-align: middle">
                                        <asp:TextBox ID="txtperson_end" runat="server" CssClass="textbox" Width="130px" ReadOnly="True"></asp:TextBox>
                                        <ajaxtoolkit:CalendarExtender ID="txtperson_end_CalendarExtender" runat="server"
                                            Enabled="True" PopupButtonID="imgperson_end" TargetControlID="txtperson_end">
                                        </ajaxtoolkit:CalendarExtender>
                                        <asp:ImageButton ID="imgperson_end" runat="server" AlternateText="Click to show calendar"
                                            ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label45" runat="server" CssClass="label_hbk">�������Ҫԡ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:DropDownList ID="cboMember_type" runat="server" CssClass="textbox">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtbudget_plan_code"
                                            Display="None" ErrorMessage="��سһ�͹�ѧ������ҳ" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label51" runat="server" CssClass="label_hbk">�ѵ������ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtmember_type_add" runat="server" CssClass="numberbox" Width="130px">0.00</asp:TextBox>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                            Enabled="True" FilterType="Custom, Numbers" TargetControlID="txtmember_type_add"
                                            ValidChars=".">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label46" runat="server" CssClass="label_hbk">���˹觺����� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="text-align: left">
                                        <asp:TextBox ID="txtperson_manage_code" runat="server" CssClass="textbox" MaxLength="5"
                                            Width="80px"></asp:TextBox>&nbsp;<asp:ImageButton ID="imgList_person_manage" runat="server"
                                                ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" CausesValidation="False">
                                            </asp:ImageButton>
                                        <asp:ImageButton ID="imgClear_person_manage" runat="server" CausesValidation="False"
                                            ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif"></asp:ImageButton>
                                        &nbsp;<asp:TextBox ID="txtperson_manage_name" runat="server" CssClass="textboxdis"
                                            MaxLength="100" Width="200px"></asp:TextBox>
                                    </td>
                                    <td nowrap align="right" valign="middle">
                                        <asp:Label ID="Label1" runat="server">������������ҳ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &nbsp;<asp:DropDownList ID="cboBudget_type" runat="server" AutoPostBack="True" CssClass="textbox"
                                            OnSelectedIndexChanged="cboBudget_type_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label70" runat="server" CssClass="label_error">*</asp:Label>
                                        <asp:Label ID="Label52" runat="server" CssClass="label_hbk">�ѧ������ҳ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbudget_plan_code" runat="server" CssClass="textbox" Width="80px"
                                            MaxLength="10"></asp:TextBox>
                                        &nbsp;<asp:ImageButton ID="imgList_budget_plan" runat="server" CausesValidation="False"
                                            ImageAlign="AbsBottom" ImageUrl="../../images/controls/view2.gif" />
                                        <asp:ImageButton ID="imgClear_budget_plan" runat="server" CausesValidation="False"
                                            ImageAlign="AbsBottom" ImageUrl="../../images/controls/erase.gif" />
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label54" runat="server" CssClass="label_hbk">Ἱ�� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtbudget_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label55" runat="server" CssClass="label_hbk">��¡�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtproduce_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label53" runat="server" CssClass="label_hbk">�Ԩ���� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtactivity_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label56" runat="server" CssClass="label_hbk">Ἱ�ҹ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtplan_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label57" runat="server" CssClass="label_hbk">�ҹ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtwork_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="height: 22px">
                                        <asp:Label ID="Label58" runat="server" CssClass="label_hbk">�ͧ�ع :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="height: 22px">
                                        <asp:TextBox ID="txtfund_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right; height: 22px;">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="height: 22px">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label60" runat="server" CssClass="label_hbk">�ѧ�Ѵ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtdirector_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label61" runat="server" CssClass="label_hbk">˹��§ҹ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtunit_name" runat="server" CssClass="textboxdis" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label64" runat="server" CssClass="label_hbk">�է�����ҳ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtbudget_plan_year" runat="server" CssClass="textboxdis" Width="130px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label62" runat="server" CssClass="label_hbk">ʶҹС�÷ӧҹ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="cboPerson_work_status" runat="server" CssClass="textbox">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td nowrap style="text-align: right">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td nowrap style="text-align: right">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="4" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="4" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="�����Ż���ѵ�ʶҹ��Ҿ��ǹ��� ">
                        <HeaderTemplate>
                            ʶҹ��Ҿ��ǹ���
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%" colspan="2">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="" width="8%">
                                        <asp:Label ID="Label74" runat="server" CssClass="label_error">*</asp:Label><asp:Label
                                            ID="Label4" runat="server" CssClass="label_hbk">�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="50%" colspan="2">
                                        <asp:DropDownList ID="cboPerson_sex" runat="server" CssClass="textbox">
                                            <asp:ListItem Selected="True">---- ��س����͡������ ----</asp:ListItem>
                                            <asp:ListItem Value="M">���</asp:ListItem>
                                            <asp:ListItem Value="F">˭ԧ</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="cboPerson_sex"
                                            Display="None" ErrorMessage="��س����͡��" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label5" runat="server" CssClass="label_hbk">���˹ѡ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" colspan="2">
                                        <asp:TextBox ID="txtperson_width" runat="server" CssClass="textbox" Width="120px"
                                            MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label7" runat="server" CssClass="label_hbk">��ǹ�٧ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_high" runat="server" CssClass="textbox" Width="120px"
                                            MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label9" runat="server" CssClass="label_hbk">���ͪҵ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_origin" runat="server" CssClass="textbox" Width="360px"
                                            MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label23" runat="server" CssClass="label_hbk">�ѭ�ҵ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" colspan="2">
                                        <asp:TextBox ID="txtperson_nation" runat="server" CssClass="textbox" Width="360px"
                                            MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label24" runat="server" CssClass="label_hbk">��ʹ� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:TextBox ID="txtperson_religion" runat="server" CssClass="textbox" Width="360px"
                                            MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label25" runat="server" CssClass="label_hbk">�ѹ�Դ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap style="vertical-align: middle" width="10%">
                                        <asp:TextBox ID="txtperson_birth" runat="server" CssClass="textbox" Width="120px"></asp:TextBox><ajaxtoolkit:CalendarExtender
                                            ID="calendarButtonExtender" runat="server" BehaviorID="txtperson_birth_CalendarExtender"
                                            Enabled="True" PopupButtonID="imgperson_birth" TargetControlID="txtperson_birth">
                                        </ajaxtoolkit:CalendarExtender>
                                        <asp:ImageButton ID="imgperson_birth" runat="server" AlternateText="Click to show calendar"
                                            ImageAlign="AbsMiddle" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    </td>
                                    <td align="left" nowrap style="vertical-align: middle">
                                        <asp:Label ID="lblAge" runat="server" CssClass="label_hbk" Font-Bold="True">���� :</asp:Label>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label75" runat="server" CssClass="label_error">*</asp:Label><asp:Label
                                            ID="Label26" runat="server" CssClass="label_hbk">ʶҹ����� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        <asp:DropDownList ID="cboPerson_marry" runat="server" CssClass="textbox">
                                            <asp:ListItem Selected="True">---- ��س����͡������ ----</asp:ListItem>
                                            <asp:ListItem Value="1">�ʴ</asp:ListItem>
                                            <asp:ListItem Value="2">����</asp:ListItem>
                                            <asp:ListItem Value="3">����</asp:ListItem>
                                            <asp:ListItem Value="4">�����</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="cboPerson_marry"
                                            Display="None" ErrorMessage="��س����͡ʶҹ�����" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle" colspan="2">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="�����Ż���ѵԷ����������� ">
                        <HeaderTemplate>
                            ������������
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="2" cellspacing="2" style="width: 100%;">
                                <tr align="left">
                                    <td align="right" nowrap style="" valign="middle" width="13%">
                                    </td>
                                    <td align="left" nowrap style="" valign="middle" width="35%">
                                    </td>
                                    <td nowrap style="text-align: right;" width="15%">
                                    </td>
                                    <td style="text-align: left" width="35%">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="" width="13%">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" width="35%">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td nowrap style="text-align: right" width="15%">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td style="text-align: left" width="35%">
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label10" runat="server" CssClass="label_hbk">��ͧ�Ţ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="" width="35%">
                                        <asp:TextBox ID="txtperson_room" runat="server" CssClass="textbox" Width="260px"
                                            MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right" width="15%">
                                        <asp:Label ID="Label27" runat="server" CssClass="label_hbk">��鹷�� :</asp:Label>
                                    </td>
                                    <td style="text-align: left" width="35%">
                                        <asp:TextBox ID="txtperson_floor" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label11" runat="server" CssClass="label_hbk">�����ҹ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_village" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label28" runat="server" CssClass="label_hbk">�Ţ��� :</asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtperson_homeno" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label12" runat="server" CssClass="label_hbk">��͡/��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_soi" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right;">
                                        <asp:Label ID="Label34" runat="server" CssClass="label_hbk">������ :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_moo" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label30" runat="server" CssClass="label_hbk">��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_road" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label35" runat="server" CssClass="label_hbk">�Ӻ� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_tambol" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle" style="">
                                        <asp:Label ID="Label31" runat="server" CssClass="label_hbk">����� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle" style="">
                                        <asp:TextBox ID="txtperson_aumphur" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label36" runat="server" CssClass="label_hbk">�ѧ��Ѵ :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtperson_province" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label32" runat="server" CssClass="label_hbk">������ɳ��� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_postno" runat="server" CssClass="textbox" MaxLength="10"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label37" runat="server" CssClass="label_hbk">���Ѿ�� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_tel" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label40" runat="server" CssClass="label_hbk">���Դ��͡óթء�Թ :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_contact" runat="server" CssClass="textbox" MaxLength="100"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="text-align: right">
                                        <asp:Label ID="Label33" runat="server" CssClass="label_hbk">��������ѹ�� :</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtperson_ralation" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                        <asp:Label ID="Label39" runat="server" CssClass="label_hbk">���Ѿ�� :</asp:Label>
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                        <asp:TextBox ID="txtperson_contact_tel" runat="server" CssClass="textbox" MaxLength="50"
                                            Width="260px"></asp:TextBox>
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" nowrap valign="middle">
                                    </td>
                                    <td nowrap style="">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" nowrap valign="middle">
                                    </td>
                                    <td align="left" colspan="3" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="4" nowrap valign="middle">
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td align="right" colspan="4" nowrap valign="middle">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="����������Ѻ/����">
                        <HeaderTemplate>
                            ����������Ѻ/����
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr align="center">
                                    <td align="left" nowrap style="height: 30px; width: 42%" valign="top">
                                        <asp:Label ID="Label13" runat="server" CssClass="label_hbk">�Ţ���ѭ���Թ������ѡ�ҹ  :</asp:Label>
                                        <asp:TextBox ID="txtCumulative_acc" runat="server" CssClass="textbox" Width="180px"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label2" runat="server" CssClass="label_hbk">�Թ������ѡ�ҹ¡�� :</asp:Label>
                                        <asp:TextBox ID="txtCumulative_money" runat="server" CssClass="numberbox" Width="130px">0.00</asp:TextBox>
                                        <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                            Enabled="True" FilterType="Custom, Numbers" TargetControlID="txtCumulative_money"
                                            ValidChars=".">
                                        </ajaxtoolkit:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td align="center" nowrap style="width: 42%" valign="top">
                                        <div id="div-gridfix">
                                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                BackColor="White" BorderWidth="1px" CellPadding="2" CssClass="stGrid" Font-Bold="False"
                                                Font-Size="10pt" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound"
                                                OnRowDeleting="GridView1_RowDeleting" OnSorting="GridView1_Sorting" Style="width: 100%">
                                                <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo" runat="server" CssClass="label_hbk"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��������¡��" SortExpression="item_type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_type" runat="server" CssClass="label_hbk" Text='<%# getItemtype(DataBinder.Eval(Container, "DataItem.item_type")) %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���������/����" SortExpression="item_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_code" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.item_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����/��������" SortExpression="item_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_name" runat="server" CssClass="label_hbk" Text='<% # DataBinder.Eval(Container, "DataItem.item_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�ѧ������ҳ" SortExpression="budget_plan_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbudget_plan_code" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.budget_plan_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="������������ҳ" SortExpression="budget_type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbudget_type" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.budget_type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="��¡���ԡ" SortExpression="material_name">
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hddmaterial_id" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.material_id") %>' />
                                                            <asp:Label ID="lblmaterial_name" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.material_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Debit" SortExpression="item_debit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_debit" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.item_debit") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" SortExpression="item_credit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblitem_credit" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.item_credit") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="8%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.c_active") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" SortExpression="c_active" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgStatus" runat="server" CausesValidation="False" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Edit" /><asp:ImageButton
                                                                ID="imgDelete" runat="server" CausesValidation="False" CommandName="Delete" /></ItemTemplate>
                                                        <HeaderTemplate>
                                                            <asp:ImageButton ID="imgAdd" runat="server" CommandName="Add" /></HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="stGridHeader" HorizontalAlign="Center" />
                                                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/images/next.gif" NextPageText="Next &amp;gt;&amp;gt;"
                                                    Position="Top" PreviousPageImageUrl="~/images/prev.gif" PreviousPageText="&amp;lt;&amp;lt; Previous">
                                                </PagerSettings>
                                                <PagerStyle BackColor="Gainsboro" ForeColor="#8C4510" HorizontalAlign="Center" Wrap="True" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel8" runat="server" HeaderText="�����źѭ���Թ���">
                        <HeaderTemplate>
                            �����źѭ���Թ���
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr align="center">
                                    <td align="center" nowrap style="width: 42%" valign="top">
                                        <div id="div1">
                                            <asp:GridView ID="gViewLoan" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                BackColor="White" BorderWidth="1px" CellPadding="2" CssClass="stGrid" Font-Bold="False"
                                                Font-Size="10pt" OnRowCreated="gViewLoan_RowCreated" OnRowDataBound="gViewLoan_RowDataBound"
                                                OnRowDeleting="gViewLoan_RowDeleting" OnSorting="gViewLoan_Sorting" Style="width: 100%">
                                                <AlternatingRowStyle BackColor="#EAEAEA"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo" runat="server" CssClass="label_hbk"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="false" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����Թ���" SortExpression="loan_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblloan_code" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.loan_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����Թ���" SortExpression="loan_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblloan_name" runat="server" CssClass="label_hbk" Text='<% # DataBinder.Eval(Container, "DataItem.loan_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="30%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�Ţ���ѭ��" SortExpression="loan_acc">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblloan_acc" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.loan_acc") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="15%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���ͺѭ��" SortExpression="loan_acc_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblloan_acc_name" runat="server" CssClass="label_hbk" Text='<%# DataBinder.Eval(Container, "DataItem.loan_acc_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="25%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Edit" />
                                                            <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" CommandName="Delete" />
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                            <asp:ImageButton ID="imgAdd" runat="server" CommandName="Add" /></HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="stGridHeader" HorizontalAlign="Center" />
                                                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/images/next.gif" NextPageText="Next &amp;gt;&amp;gt;"
                                                    Position="Top" PreviousPageImageUrl="~/images/prev.gif" PreviousPageText="&amp;lt;&amp;lt; Previous">
                                                </PagerSettings>
                                                <PagerStyle BackColor="Gainsboro" ForeColor="#8C4510" HorizontalAlign="Center" Wrap="True" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="��Ҫԡ(�һ��Ԩ)"
                        ScrollBars="Vertical">
                        <HeaderTemplate>
                            ��Ҫԡ(�һ��Ԩ)
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr align="left">
                                    <td>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td>
                                        <div id="div-gridfix2">
                                            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                BackColor="White" BorderWidth="1px" CellPadding="2" CssClass="stGrid" Font-Bold="False"
                                                Font-Size="10pt" OnRowCreated="GridView2_RowCreated" OnRowDataBound="GridView2_RowDataBound"
                                                OnRowDeleting="GridView2_RowDeleting" OnSorting="GridView2_Sorting" Style="width: 100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo1" runat="server"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="������Ҫԡ(�һ��Ԩ)" SortExpression="member_code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_code" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.member_code") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="������Ҫԡ(�һ��Ԩ)" SortExpression="member_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_name" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.member_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="45%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�ӹǹ����Ҫԡ" SortExpression="member_quan">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmember_quan" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.member_quan") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="15%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.c_active") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" SortExpression="c_active">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgStatus1" runat="server" CausesValidation="False" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgEdit1" runat="server" CausesValidation="False" CommandName="Edit" /><asp:ImageButton
                                                                ID="imgDelete1" runat="server" CausesValidation="False" CommandName="Delete" /></ItemTemplate>
                                                        <HeaderTemplate>
                                                            <asp:ImageButton ID="imgAdd1" runat="server" CommandName="Add" /></HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <AlternatingRowStyle BackColor="#EAEAEA" />
                                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="stGridHeader" HorizontalAlign="Center" />
                                                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/images/next.gif" NextPageText="Next &amp;gt;&amp;gt;"
                                                    Position="Top" PreviousPageImageUrl="~/images/prev.gif" PreviousPageText="&amp;lt;&amp;lt; Previous" />
                                                <PagerStyle BackColor="Gainsboro" ForeColor="#8C4510" HorizontalAlign="Center" Wrap="True" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                    <ajaxtoolkit:TabPanel ID="TabPanel7" runat="server" HeaderText="����ѵԵ��˹�" ScrollBars="Vertical">
                        <HeaderTemplate>
                            ����ѵԵ��˹�
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr align="left">
                                    <td align="left" nowrap style="width: 42%" valign="top" width="30%">
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td align="center" nowrap style="width: 42%" valign="top" width="30%">
                                        <div id="div-gridfix3">
                                            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                BackColor="White" BorderWidth="1px" CellPadding="2" CssClass="stGrid" Font-Bold="False"
                                                Font-Size="10pt" OnRowCreated="GridView3_RowCreated" OnRowDataBound="GridView3_RowDataBound"
                                                OnRowDeleting="GridView3_RowDeleting" OnSorting="GridView3_Sorting" Style="width: 100%">
                                                <AlternatingRowStyle BackColor="#EAEAEA" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNo2" runat="server"> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�ѹ����Ѻ" SortExpression="change_date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblchange_date" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.change_date") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�Թ��͹�ѵ�����" SortExpression="salary_old">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsalary_old" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.salary_old") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="15%" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�Թ��͹�ѵ������" SortExpression="salary_new">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsalary_new" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.salary_new") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" Width="15%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���˹����" SortExpression="position_old_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblposition_old" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.position_old") %>'
                                                                Visible="false"> </asp:Label><asp:Label ID="lblposition_name_old" runat="server"
                                                                    Text='<% # DataBinder.Eval(Container, "DataItem.position_old_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="25%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�дѺ���" SortExpression="level_old">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbllevel_old" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.level_old") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���˹�����" SortExpression="position_new_name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblposition_new" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.position_new") %>'
                                                                Visible="false"> </asp:Label><asp:Label ID="lblposition_new_name" runat="server"
                                                                    Text='<% # DataBinder.Eval(Container, "DataItem.position_new_name") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="25%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�дѺ����" SortExpression="level_new">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbllevel_new" runat="server" Text='<% # DataBinder.Eval(Container, "DataItem.level_new") %>'> </asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblc_active2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.c_active") %>'> </asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" Width="2%" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ʶҹ�" SortExpression="c_active">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgStatus2" runat="server" CausesValidation="False" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:ImageButton ID="imgAdd2" runat="server" CommandName="Add" /></HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgEdit2" runat="server" CausesValidation="False" CommandName="Edit" /><asp:ImageButton
                                                                ID="imgDelete2" runat="server" CausesValidation="False" CommandName="Delete" /></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="stGridHeader" HorizontalAlign="Center" />
                                                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/images/next.gif" NextPageText="Next &amp;gt;&amp;gt;"
                                                    Position="Top" PreviousPageImageUrl="~/images/prev.gif" PreviousPageText="&amp;lt;&amp;lt; Previous" />
                                                <PagerStyle BackColor="Gainsboro" ForeColor="#8C4510" HorizontalAlign="Center" Wrap="True" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </ajaxtoolkit:TabPanel>
                </ajaxtoolkit:TabContainer>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%; vertical-align: bottom;">
        <tr align="left">
            <td align="right" nowrap valign="middle" width="75%">
                &nbsp;
            </td>
            <td nowrap rowspan="3" style="text-align: center; vertical-align: bottom; width: 10%;">
                <asp:ImageButton runat="server" ValidationGroup="A" AlternateText="�ѹ�֡" ImageUrl="~/images/controls/save.jpg"
                    ID="imgSaveOnly"></asp:ImageButton>
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle" width="75%">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" ValidationGroup="A" />
                <asp:Button ID="BtnR1" runat="server" OnClick="BtnR1_Click" />
                <asp:Button ID="BtnR2" runat="server" OnClick="BtnR2_Click" />
                <asp:Button ID="BtnR3" runat="server" OnClick="BtnR3_Click" />
                <asp:Button ID="BtnR4" runat="server" OnClick="BtnR4_Click" />
                &nbsp;
            </td>
        </tr>
        <tr align="left">
            <td align="right" nowrap valign="middle">
                <asp:Label runat="server" CssClass="label_error" ID="lblError"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
