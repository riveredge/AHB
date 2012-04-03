<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="view_account.ascx.cs" Inherits="DotNetNuke.Professional.Commerce.view_account" %>
<div class="dnnCart">
    <div class="dnnCart-top roundTop">
        <div class="tracker">
            <%= ProgressTracker%>
        </div>
        <div class="dnnCart-header clearfix">
            <div>[RESX:AccountHeader]</div>
            <span>[RESX:AccountHeader:Hint]</span>
        </div>
    </div>
    <div class="dnnCart-content">
        
                        <% if (!Request.IsAuthenticated) {%>
            <div class="dnnCart-curr-user">
                <span>[RESX:ExistingUser]</span>
                <a href="#" class="dnnCart-button dnnCart-login" onclick="showLogin(); return false;"><i></i>[RESX:Button:Login]</a>
            </div>
            <% }%>
        
        
        <fieldset class="infoForm">
            <legend>[RESX:YourInformation]</legend>

            <div>
                <span>
                    <label>[RESX:FirstName]:</label>
                    <input type="text" id="apreg_FirstName" name="apreg_FirstName" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" value="<%=CurrentUser.FirstName %>" /><i class="dnnCart-tt"></i>
                </span>
                <span>
                    <label>[RESX:LastName]:</label>
                    <input type="text" id="apreg_LastName" name="apreg_LastName" onblur="ap_Validate(this);" onkeypress="ap_fieldaccess(this);" value="<%=CurrentUser.LastName %>" /><i class="dnnCart-tt"></i>
                </span>
                <span>
                    <label>[RESX:Email]:</label>
                    <input type="text" id="apreg_Email" onblur="ap_Validate(this);" onkeypress="ap_fieldaccess(this);" name="apreg_Email" value="<%=CurrentUser.Email %>" /><i class="dnnCart-tt"></i>
                </span>
            </div>
        </fieldset>
        <fieldset class="addressForm">
            <legend>[RESX:BillingAddress]</legend>
                <div>
                    <label for="apreg_Name">[RESX:Name]:</label>
                    <input type="text" id="apreg_Name" name="apreg_Name" value="<%=BillingAddress.Name %>" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" /><i class="dnnCart-tt"></i>
                </div>
                <div>
                    <label for="apreg_Street">[RESX:Street]:</label>
                    <input type="text" id="apreg_Street" name="apreg_Street" value="<%=BillingAddress.Address1 %>" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" /><i class="dnnCart-tt"></i>
                </div>
                <div>
                    <label for="apreg_City">[RESX:City]:</label>
                    <input type="text" id="apreg_City" name="apreg_City" value="<%=BillingAddress.City %>" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" /><i class="dnnCart-tt"></i>
                </div>
                <div>
                    <label for="apreg_Region">[RESX:Region]:</label>
                    <input type="text" id="apreg_Region" name="apreg_Region" onkeypress="ap_fieldaccess(this);" value="<%=BillingAddress.Region %>" /><select id="apreg_drp_Region" style="display:none;" onchange="ap_DL.regionChange(this);"><option value=""></option></select><i class="dnnCart-tt"></i>
                </div>
                <div>
                    <label for="apreg_PostalCode">[RESX:PostalCode]:</label>
                    <input type="text" id="apreg_PostalCode" onblur="ap_Validate(this);" class="am-ui-width100" name="apreg_PostalCode" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" value="<%=BillingAddress.PostalCode %>" /><i class="dnnCart-tt"></i>
                </div>
                <div>
                    <label for="apreg_Country">[RESX:Country]:</label>
                    <input type="text" id="apreg_Country" name="apreg_Country" onblur="ap_Validate(this);" onkeypress="ap_fieldaccess(this);" value="<%=BillingAddress.Country %>" style="display:none;" /><select id="apreg_drp_Country" onchange="ap_DL.countryChange(this);"><option value=""></option></select><i class="dnnCart-tt"></i>
                </div>
                <script type="text/javascript">
                        ap_DL.Init('apreg_Country', 'apreg_Region');
                </script>
        </fieldset>
                <% if (Settings.CollectShipping) {%> 
            <fieldset class="addressForm">
                <legend>[RESX:ShippingAddress]</legend>
                    <div>
                        <label for="apship_Name">[RESX:Name]:</label>
                        <input type="text" id="apship_Name" name="apship_Name" value="<%=ShippingAddress.Name %>" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" /><i class="dnnCart-tt"></i>
                    </div>
                    <div>
                        <label for="apship_Street">[RESX:Street]:</label>
                        <input type="text" id="apship_Street" name="apship_Street" value="<%=BillingStreet %>" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" /><i class="dnnCart-tt"></i>
                    </div>
                    <div>
                        <label for="apship_City">[RESX:City]:</label>
                        <input type="text" id="apship_City" name="apship_City" value="<%=BillingCity %>" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" /><i class="dnnCart-tt"></i>
                    </div>
                    <div>
                        <label for="apship_Region">[RESX:Region]:</label>
                        <input type="text" id="apship_Region" name="apship_Region" onkeypress="ap_fieldaccess(this);" value="<%=BillingRegion %>" /><select id="apship_drp_Region" style="display:none;" onchange="ap_DL.regionChange(this);"><option value=""></option></select><i class="dnnCart-tt"></i>
                    </div>
                    <div>
                        <label for="apship_PostalCode">[RESX:PostalCode]:</label>
                        <input type="text" id="apship_PostalCode" onblur="ap_Validate(this);" class="am-ui-width100" name="apship_PostalCode" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" value="<%=BillingPostalCode %>" /><i class="dnnCart-tt"></i>
                    </div>
                    <div>
                        <label for="apship_Country">[RESX:Country]:</label>
                        <input type="text" id="apship_Country" name="apship_Country" onblur="ap_Validate(this);" onkeypress="ap_fieldaccess(this);" value="<%=BillingCountry %>" style="display:none;" /><select id="apship_drp_Country" onchange="ap_DL.countryChange(this);"><option value=""></option></select><i class="dnnCart-tt"></i>
                    </div>
                    <script type="text/javascript">
                        ap_DL.Init('apship_Country', 'apship_Region');
                    </script>
            </fieldset>
   
                       
        <% } %>

            
           
        
        <% if (!Request.IsAuthenticated) {%>
        <fieldset>
            <legend>[RESX:AccountOption]</legend>
            <div class="ap-subhead-hint">[RESX:AccountOption:Hint]</div>
            <table class="am-ui-form">
                <tbody>
                <tr>
                    <td><label>[RESX:UserName]:<label></td><td><label>[RESX:Password]:<label></td><td><label>[RESX:PasswordConfirm]:</label></td>
                </tr>
                <tr>
                    <td><input style="width:175px;" type="text" id="apreg_Username" name="apreg_Username" onkeypress="ap_fieldaccess(this);" onblur="ap_Validate(this);" value="" /><i class="dnnCart-tt"></i></td>
                    <td><input style="width:175px;" type="password" id="apreg_Password" name="apreg_Password" onblur="ap_Validate(this);" onkeypress="ap_fieldaccess(this);" value="" /><i class="dnnCart-tt"></i></td>
                    <td><input style="width:175px;" type="password" id="apreg_PasswordConfirm" onblur="ap_Validate(this);" onkeypress="ap_fieldaccess(this);" name="apreg_PasswordConfirm" value="" /><i class="dnnCart-tt"></i></td>
                </tr>
                </tbody>
            </table>
        </fieldset>
     
        <% } %>
    
        
        <div class="dnnCart-buttonarea">
            <a href="#" onclick="ap_processAccount(this); return false;" id="apreg_Submit" class="dnnCart-positive checkout-icon"><i></i>[RESX:Button:ProceedToPayment]</a>
            <a href="<%=ProductsUrl %>" class="dnnCart-normal products-icon"><i></i>[RESX:Button:ContinueShopping]</a>
        </div>
        <div class="clearDiv"></div>
        </div>
        

       <div class="dnnCart-bottom roundBottom"></div>
    </div>


<div class="dnnCart-modal" id="dnnCart-login" style="width:400px;height:200px;">
    <div id="dnnCart-login-section">
        <div id="dnnCart-login-form">
            <h1>[RESX:LoginInfo]</h1>
            <h2>[RESX:LoginInfo:Hint]</h2>
            <div>
                <label for="aplogin_Username">[RESX:UserName]:</label>
                <input type="text" id="aplogin_Username" name="aplogin_Username" value="" />
            </div>
            <div>
                <label for="aplogin_Password">[RESX:Password]:</label>
                <input type="password" id="aplogin_Password" name="aplogin_Password" value="" />
            </div>
            <div class="dnnCart-buttonarea clearFix">
                <button id="btnLogin" name="aplogin_Login" class="dnnCart-positive" onclick="ap_Login(); return false;"><i></i>[RESX:Button:Login]</button>
                <button class="dnnCart-negative" onclick="dnn_comm.utils.CloseDiv('dnnCart-login'); return false;"><i></i>[RESX:Button:Cancel]</button>
            </div>
        </div>
    
    <div id="dnnCart-login-loading">
        <div class="dnnCart-loader">[RESX:PleaseWait]</div>
    </div>
    <div id="dnnCart-login-message-success">
        <h1>[RESX:Success]</h1>
        <h3 id="alls-msg">[RESX:LoginSuccess]</h3>
        <div class="dnnCart-buttonarea clearFix">
           <a href="<%=CurrentUrl %>" class="reload-icon"><i></i>[RESX:Button:Reload]</a>
        </div>
    </div>
    <div id="dnnCart-login-message-failed">
        <h1>[RESX:Problems]</h1>
        <h3 id="allf-msg"></h3>
         <div class="dnnCart-buttonarea clearFix">
            <button class="next-icon" onclick="ap_passShowForm(); return false;"><i></i>[RESX:Button:PasswordReminder]</button>
            <button class="next-icon" onclick="ap_loginShowForm(); return false;"><i></i>[RESX:Button:TryAgain]</button>
            <button class="dnnCart-negative" onclick="ap_LoginCancel(); return false;"><i></i>[RESX:Button:Cancel]</button>
        </div>
    </div>
    </div>
    <div id="dnnCart-pass" style="display:none;">
        <div id="dnnCart-login-password" style="display:none;">
            <h1>[RESX:PasswordReminder]</h1>
            <h2>[RESX:PasswordReminder:Hint]</h2>
            <div>
                <label for="appass_Username">[RESX:UserNameOrEmail]:</label>
                <input type="text" id="appass_Username" name="appass_Username" value="" />
            </div>
            <div class="dnnCart-buttonarea clearFix">
                <button class="back-icon" onclick="ap_loginShowForm(); return false;"><i></i>[RESX:Button:BackToLogin]</button>
                <button class="dnnCart-positive" onclick="ap_Pass(); return false;"><i></i>[RESX:Button:SendPassword]</button>
            </div>
        </div>
        
    <div id="dnnCart-pass-loading" style="display:none;">
        <div class="dnnCart-loader">[RESX:PleaseWait]</div>
    </div>
        <div id="dnnCart-login-password-success" style="display:none;">
            <h1>[RESX:Success]</h1>
            <h3 id="alps-msg"></h3>
            <div class="dnnCart-buttonarea clearFix">
                <button class="back-icon" onclick="ap_loginShowForm(); return false;"><i></i>[RESX:Button:BackToLogin]</button>
                <button class="dnnCart-negative" onclick="ap_LoginCancel(); return false;"><i></i>[RESX:Button:Cancel]</button>
            </div>
        </div>
        <div id="dnnCart-login-password-failed" style="display:none;">
            <h3 id="alpf-msg"></h3>
        </div>
    </div>
</div>
<div class="dnnCart-modal" id="ap-wait" style="width:400px;height:200px;">
    <div>
        <div class="dnnCart-loader">[RESX:PleaseWait]</div>
    </div>
</div>