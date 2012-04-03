<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="ViewLicx.ascx.cs" Inherits="DotNetNuke.Professional.LicenseActivation.ViewLicx" %>
<%@ Register TagPrefix="dnnweb" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<script type="text/javascript">
	function setServerAppName() {
		try {
			var serverslst = document.getElementById("<%=lstServers.ClientID%>");
			var serverID = serverslst.value;
			if (serverID && serverID != "") {
				var lblAppName = document.getElementById("<%=LblSelectedServerAppName.ClientID%>");
				var appNameLst = document.getElementById("<%=lstServerAppNames.ClientID%>");
				if (lblAppName && appNameLst) {
					for (var i = 0; i < appNameLst.length; i++) {
						if (appNameLst[i].value == serverID) {
							lblAppName.innerHTML = appNameLst[i].text;
							break;
						}
					}
				}
			}
		}
		catch (ex) {
			try {
				var lblAppName = document.getElementById("<%=LblSelectedServerAppName.ClientID%>");
				lblAppName.innerHTML = "";
			}
			catch (ex) { }
		}
	}
</script>
<div class="dnnForm dnnViewLicx dnnClear" id="dnnViewLicx">
    <div class="dnnLicenseList" id="dnnLicenseList" runat="server">
        <div class="dnnFormMessage dnnFormInfo" runat="server" visible="false">
            <%=GetControlHelp()%>
        </div>
        <dnnweb:DnnGrid ID="dgLicense" runat="server" CssClass="dnnLicenseGrid" AutoGenerateColumns="false" AllowSorting="true">
            <MasterTableView DataKeyNames="LicenseID">
                <Columns>
                    <dnnweb:DnnGridTemplateColumn HeaderText="LicenseType">
                        <ItemTemplate>
                            <%#Eval("Environment")%>   
                        </ItemTemplate>
                    </dnnweb:DnnGridTemplateColumn>
                    <dnnweb:DnnGridBoundColumn UniqueName="Invoice" HeaderText="Invoice" DataField="Invoice" />
                    <dnnweb:DnnGridBoundColumn UniqueName="HostName" HeaderText="HostName" DataField="HostName" />
                    <dnnweb:DnnGridTemplateColumn HeaderText="Activated">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkActivated" runat="server" Checked='<%#Eval("Activated")%>' Enabled="false" />
                        </ItemTemplate>
                    </dnnweb:DnnGridTemplateColumn>
                    <dnnweb:DnnGridBoundColumn UniqueName="ServiceEndDate" HeaderText="ServiceEndDate" DataField="ServiceEndDate" DataFormatString="{0:D}" />
                    <dnnweb:DnnGridTemplateColumn UniqueName="Renew">
                        <ItemTemplate>
                            <asp:Button id="grdRowRenew" runat="server" commandname="Renew" enabled='<%#EnableRenew(Container.DataItem)%>'  text='<%#GetString("Renew.Text")%>' />
                        </ItemTemplate>
                    </dnnweb:DnnGridTemplateColumn>
                    <dnnweb:DnnGridTemplateColumn UniqueName="Deactivate">
                        <ItemTemplate>
                            <asp:Button id="grdRowDelete" runat="server" commandname="Deactivate" text='<%#GetString("Delete.Text")%>' OnClientClick="<%#DeleteWarning%>" />
                        </ItemTemplate>
                    </dnnweb:DnnGridTemplateColumn>
                </Columns>
                <NoRecordsTemplate>
                    <div class="dnnFormMessage dnnFormWarning">
                        <asp:Label ID="lblNoRecordsTemplate" runat="server" resourcekey="NoLicenses" />
                    </div>
                </NoRecordsTemplate>
            </MasterTableView>
        </dnnweb:DnnGrid>     
        <ul class="dnnActions dnnClear">
            <li><asp:LinkButton ID="cmdAddLicense" runat="server" CssClass="dnnPrimaryAction" resourcekey="cmdAddLicense" /></li>
            <li><asp:LinkButton ID="cmdExtendTrial" runat="server" CssClass="dnnSecondaryAction" resourcekey="cmdExtendTrial" /></li>
            <li><asp:LinkButton ID="cmdActivateTrial" runat="server" CssClass="dnnSecondaryAction" resourcekey="cmdActivateTrial" /></li>
        </ul>
    </div>
    <div id="licxTabs" class="licxTabs" runat="server">
	    <div id="onlinetab" runat="server" class="ltOnline">
            <div class="dnnFormItem">
                <dnn:label id="plTrialLicense" runat="server" controlname="chkTrialLicense" suffix=":" />
                <asp:CheckBox ID="chkTrialLicense" runat="server" AutoPostBack="true" />
            </div>
            <div id="divAccount" runat="server">
                <div class="dnnFormItem">
                    <dnn:label id="plSelectLicenseType" runat="server" suffix=":" />
                    <asp:DropDownList ID="lstLicenseType" runat="server" />
                </div>
                <div class="dnnFormItem">
                    <dnn:label id="plMachine" runat="server" controlname="txtMachine" suffix=":" />
                    <asp:DropDownList ID="lstServers" runat="server" />
                    <span id="LblSelectedServerAppName" runat="server" title="IIS Application" />
				    <div style="display:none">
					    <asp:DropDownList ID="lstServerAppNames" runat="server" />
				    </div>
                </div>
                <div class="dnnFormItem">
                    <dnn:label id="plAccount" runat="server" controlname="txtAccount" suffix=":" />
                    <asp:TextBox runat="server" ID="txtAccount" autocomplete="off" />
                    <asp:RequiredFieldValidator ID="valAccount" runat="server" ErrorMessage='<%#GetString("Account.Required")%>' ControlToValidate="txtAccount" Display="Dynamic" EnableViewState="False" SetFocusOnError="True" ValidationGroup="Account" CssClass="dnnFormMessage dnnFormError" />
                </div>
                <div class="dnnFormItem">
                    <dnn:label id="plInvoice" runat="server" controlname="txtInvoice" suffix=":" />
                     <asp:TextBox runat="server" ID="txtInvoice" autocomplete="off" />
                     <asp:RequiredFieldValidator ID="valInvoice" runat="server" ErrorMessage='<%#GetString("Invoice.Required")%>' ControlToValidate="txtInvoice" Display="Dynamic" EnableViewState="False" SetFocusOnError="True" ValidationGroup="Account" CssClass="dnnFormMessage dnnFormError" />
                </div>
		        <div class="dnnFormMessage dnnFormWarning">
                    <asp:Label runat="server" ID="lblCheckLicense" />
                </div>
            </div>
		    <ul class="dnnActions dnnClear">
                <li><asp:LinkButton ID="cmdAutoActivation" runat="server" resourcekey="cmdAutoActivation" ValidationGroup="Account" CssClass="dnnPrimaryAction" /></li>
                <li><asp:LinkButton ID="cmdGenLicenseKey" runat="server" resourcekey="cmdGenLicenseKey" ValidationGroup="Account" CssClass="dnnSecondaryAction" /></li>
                <li><asp:LinkButton ID="cmdGoBackOnline" runat="server" CssClass="dnnSecondaryAction" resourcekey="GoBack" CausesValidation="false" /></li>
            </ul>
	    </div>
	    <div id="manualtab" runat="server" class="ltManual" visible="false">
            <div class="dnnFormMessage dnnFormWarning">
                <%=GetString("Step1")%>
            </div>
            <div class="dnnFormItem">
                <dnn:label id="plServerId" runat="server" controlname="txtServerId" suffix=":" />
                <asp:TextBox ID="txtServerId" runat="server" TextMode="MultiLine" Width="500px" Height="200px" />
            </div>
            <div class="dnnFormMessage dnnFormWarning">
                 <%=GetString("Step2")%>
            </div>
            <div class="dnnFormItem">
                <a href="<%=GetLicxRequestUrl()%>" class="CommandButton" target="_blank"><%=GetString("RequestLicx")%></a>
            </div>
            <div class="dnnFormMessage dnnFormWarning">
                 <%=GetString("Step3")%>
            </div>
            <div class="dnnFormItem">
                <dnn:label id="plActivationKey" runat="server" controlname="txtActivationKey" suffix=":" />
                <asp:TextBox runat="server" ID="txtActivationKey" TextMode="MultiLine" Width="500px" Height="200px" />
                <asp:RequiredFieldValidator ID="valActivationKey" ValidationGroup="ManualActivation" Display="Dynamic" resourcekey="valActivationKey" CssClass="dnnFormMessage dnnFormError" ControlToValidate="txtActivationKey" SetFocusOnError="true" runat="server" />
            </div>
            <div class="dnnFormMessage dnnFormWarning">
                 <%=GetString("Step4")%>
            </div>
            <ul class="dnnActions">
                <li><asp:LinkButton ID="cmdUpload" runat="server" resourcekey="cmdUpload" CssClass="dnnPrimaryAction" ValidationGroup="ManualActivation" /></li>
                <li><asp:LinkButton ID="cmdCancel" runat="server" resourcekey="cmdCancel" CssClass="dnnSecondaryAction" CausesValidation="false" /></li>
            </ul>
	    </div>
	    <div id="extendtab" runat="server" class="ltExtend" visible="false">
            <fieldset>
                <div class="dnnFormMessage dnnFormInfo">
                    <asp:Label runat="server" ID="lblExtendTrial" resourceKey="lblExtendTrial" />
                </div>
                <div class="dnnFormItem">
                     <dnn:label id="plEmail" runat="server" controlname="txtEmail" suffix=":" />
                     <asp:TextBox runat="server" ID="txtEmail" />
				    <asp:RequiredFieldValidator ID="valEmail" runat="server" ErrorMessage='<%=GetString("Email.Required")%>' ControlToValidate="txtEmail" Display="Dynamic" EnableViewState="False" SetFocusOnError="True" ValidationGroup="Extend" CssClass="dnnFormMessage dnnFormError" />
                </div>
                <div class="dnnFormItem">
                    <dnn:label id="plCompany" runat="server" controlname="txtCompany" suffix=":" />
                    <asp:TextBox runat="server" ID="txtCompany" Width="275" />
                </div>
                <div class="dnnFormItem">
                    <dnn:label id="plFirstName" runat="server" controlname="txtFirstName" suffix=":" />
                    <asp:TextBox runat="server" ID="txtFirstName" />
                    <asp:RequiredFieldValidator ID="valFirstname" runat="server" ErrorMessage='<%=GetString("FirstName.Required")%>' ControlToValidate="txtFirstName" Display="Dynamic" EnableViewState="False" SetFocusOnError="True" ValidationGroup="Extend" CssClass="dnnFormMessage dnnFormError" />
                </div>
                <div class="dnnFormItem">
                    <dnn:label id="plLastName" runat="server" controlname="txtLastName" suffix=":" />
                    <asp:TextBox runat="server" ID="txtLastName" />
				    <asp:RequiredFieldValidator ID="valLastname" runat="server" ErrorMessage='<%=GetString("LastName.Required")%>' ControlToValidate="txtLastName" Display="Dynamic" EnableViewState="False" SetFocusOnError="True" ValidationGroup="Extend" CssClass="dnnFormMessage dnnFormError" />
                </div>
                <ul class="dnnActions dnnClear">
                    <li><asp:LinkButton ID="cmdRequestExtension" resourcekey="cmdRequestExtension" runat="server" ValidationGroup="Extend" CssClass="dnnPrimaryAction" CausesValidation="True" /></li>
                    <li><asp:LinkButton ID="cmdGoBackExtend" runat="server" CssClass="dnnSecondaryAction" resourcekey="GoBack" CausesValidation="false" /></li>
                </ul>
            </fieldset>
	    </div>
	    <div id="activatetab" runat="server" class="ltActivate" visible="false">
            <fieldset>
                <legend><asp:Label runat="server" ID="Label1" /></legend>
                <div class="dnnFormItem">
                    <dnn:label id="plLicenseKey" runat="server" controlname="txtLicenseKey" suffix=":" />
                    <asp:TextBox runat="server" ID="txtLicenseKey" autocomplete="off" />
                    <asp:RequiredFieldValidator ID="valLicenseKey" runat="server" resourcekey="valLicenseKey" ControlToValidate="txtLicenseKey" Display="Dynamic" EnableViewState="False" SetFocusOnError="True" ValidationGroup="ActivateKey" CssClass="dnnFormMessage dnnFormError" />
                </div>
                <ul class="dnnActions dnnClear">
                    <li><asp:LinkButton ID="cmdActivateExtension" resourcekey="cmdActivateExtension" runat="server" CssClass="dnnPrimaryAction" ValidationGroup="ActivateKey" /></li>
                    <li><asp:LinkButton ID="cmdGoBackActivate" runat="server" CssClass="dnnSecondaryAction" resourcekey="GoBack" CausesValidation="false" /></li>
                </ul>
            </fieldset>
	    </div>
    </div>
</div>