<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="GIP.Company.CompanyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section id="hero" class="hero section Login">

      <img src="Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

      <div class="container login">
          <!-- Section Title -->

          <div class="form-signin rounded-sm shadow">
              <div class="tab-content">

                  <div class="container section-title" data-aos="fade-up">
                      <h2>تفاصيل الشركة</h2>
                  </div>



              
                                
                                  <div>
                                      <asp:Label ID="Label3" runat="server" CssClass="form-label mb-2" Text="اسم مقدم الطلب"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <asp:TextBox ID="SanadName" runat="server" CssClass="form-control mb-4" placeholder="اسم مقدم الطلب"
                                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                  </div>
                                  <div>
                                      <asp:Label ID="Label4" runat="server" CssClass="form-label mb-2" Text="جنسية مقدم الطلب"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <asp:TextBox ID="SanadNat" runat="server" CssClass="form-control mb-4" placeholder="جنسية مقدم الطلب"
                                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                  </div>
                                  <div>
                                      <asp:Label ID="Label5" runat="server" CssClass="form-label mb-2 " Text="رقم الهاتف لمقدم الطلب"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <asp:TextBox ID="SanadPhone" runat="server" CssClass="form-control mb-4 phoneInput" placeholder="رقم الهاتف لمقدم الطلب"
                                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                  </div>
                                  <div>
                                      <asp:Label ID="Label6" runat="server" CssClass="form-label mb-2" Text="البريد الالكتروني لمقدم الطلب"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <asp:TextBox ID="SanadEmail" runat="server" CssClass="form-control mb-4" placeholder="البريد الالكتروني لمقدم الطلب"
                                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                  </div>
                                  <div>
                                      <asp:Label ID="Label7" runat="server" CssClass="form-label mb-2" Text="المسمى الوظيفي لمقدم الطلب"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <asp:TextBox ID="SanadJob" runat="server" CssClass="form-control mb-2" placeholder="المسمى الوظيفي لمقدم الطلب"
                                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>

                                  </div>
                                  <div>
                                      <asp:Label ID="Label8" runat="server" CssClass="form-label mb-2" Text="صفة مقدم الطلب"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <asp:DropDownList ID="DelegetTypeList" CssClass="form-control-list"
                                          runat="server" Font-Size="10pt" AppendDataBoundItems="true"
                                          DataSourceID="SqlDataSource3" ClientIDMode="Static"
                                          OnSelectedIndexChanged="DelegetTypeList_SelectedIndexChanged"
                                          DataTextField="Delegation_Type" DataValueField="Delegation_ID">
                                          <asp:ListItem Text="صفة مقدم الطلب" Value="0" />
                                      </asp:DropDownList>
                                      <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                          ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                          SelectCommand="DelegationLookUp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                      <asp:RequiredFieldValidator runat="server"
                                          ID="RequiredFieldValidator2" ControlToValidate="DelegetTypeList"
                                          ErrorMessage="يرجى اختيار صفة المقدم   !" InitialValue="0"
                                          CssClass="validator" Display="Dynamic"
                                          ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                          ValidationGroup="ApplicantInfo">  
                                      </asp:RequiredFieldValidator>
                                  </div>






                  <div>
                      <asp:Label ID="Label17" runat="server" CssClass="form-label mb-2" Text="رقم الوطني للشركة/ المؤسسة فردية"
                          Font-Bold="true" Font-Size="Small"></asp:Label>

                      <asp:TextBox ID="CompanyNatNumber" runat="server" CssClass="form-control mb-4" placeholder="رقم الوطني للشركة/ المؤسسة فردية"
                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                  </div>

                  <div>
                      <asp:Label ID="Label10" runat="server" CssClass="form-label mb-2" Text="اسم الشركة/المؤسسة فردية"
                          Font-Bold="true" Font-Size="Small"></asp:Label>

                      <asp:TextBox ID="CompanyName" runat="server" CssClass="form-control mb-4" placeholder="اسم الشركة/المؤسسة فردية"
                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                  </div>

                  <div>
                      <asp:Label ID="Label15" runat="server" CssClass="form-label mb-2" Text="تاريخ تأسيس الشركة/مؤسسة فردية"
                          Font-Bold="true" Font-Size="Small"></asp:Label>

                      <asp:TextBox ID="CompanyRegDate" runat="server" CssClass="form-control mb-4" placeholder="تاريخ تأسيس الشركة/مؤسسة فردية"
                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                  </div>

                  <div>
                      <asp:Label ID="Label16" runat="server" CssClass="form-label mb-2" Text="رقم الضمان الاجتماعي للشركة/ المؤسسة فردية"
                          Font-Bold="true" Font-Size="Small"></asp:Label>

                      <asp:TextBox ID="SSCNumber" runat="server" CssClass="form-control mb-4" placeholder="رقم الضمان الاجتماعي للشركة/ المؤسسة فردية"
                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                  </div>

                  <div>
                      <asp:Label ID="Label11" runat="server" CssClass="form-label mb-2" Text="رقم الهاتف الشركة/مؤسسة فردية"
                          Font-Bold="true" Font-Size="Small"></asp:Label>

                      <asp:TextBox ID="CompanyPhone" runat="server" CssClass="form-control mb-2 phoneInput" placeholder="رقم الهاتف الشركة/مؤسسة فردية"
                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                  </div>

                  <div>
                      <asp:Label ID="Label12" runat="server" CssClass="form-label mb-2" Text="البريد الالكتروني الشركة/مؤسسة فردية"
                          Font-Bold="true" Font-Size="Small"></asp:Label>

                      <asp:TextBox ID="CompanyEmail" runat="server" CssClass="form-control mb-2" placeholder="البريد الالكتروني الشركة/مؤسسة فردية"
                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>

                  </div>
                  <div>
                      <asp:Label ID="Label22" runat="server" CssClass="form-label mb-2" Text="اسم المفوض بالتوقيع "
                          Font-Bold="true" Font-Size="Small"></asp:Label>

                      <asp:TextBox ID="CompSignDel" runat="server" CssClass="form-control mb-4" placeholder="اسم المفوض بالتوقيع"
                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>

                  </div>


                  <div>
                      <asp:Label ID="Label14" runat="server" CssClass="form-label mb-2" Text="المحافظة"
                          Font-Bold="true" Font-Size="Small"></asp:Label>
                      <asp:TextBox ID="GovernateName" runat="server" CssClass="form-control mb-4"
                          Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>

                  </div>


                  <div>
                                          <asp:Label ID="Label13" runat="server" CssClass="form-label mb-2" Text="النشاط الرئيسي لشركة /المؤسسة الفردية"
                                              Font-Bold="true" Font-Size="Small"></asp:Label>

                                          <asp:TextBox ID="MainActive" runat="server" CssClass="form-control mb-2" placeholder="النشاط الرئيسي لشركة /المؤسسة الفردية"
                                              Font-Bold="true" Font-Size="Small" TextMode="MultiLine" Enabled="false"></asp:TextBox>

                                      </div>
                                  
                            
                                  <div>
                                      <div>
                                          <asp:Label ID="Label18" runat="server" CssClass="form-label mb-2" Text="أفرع للشركة/ المؤسسة فردية"
                                              Font-Bold="true" Font-Size="Small"></asp:Label>
                                          <asp:TextBox ID="CompBranch" runat="server" CssClass="form-control " placeholder="أفرع للشركة/ المؤسسة فردية"
                                              Font-Bold="true" Font-Size="Small"></asp:TextBox>


                                      </div>
                                      <asp:Button ID="AddBranch" Text="اضافة الفرع" CssClass="btn btn-primary mt-2 login-btn col-md-12" runat="server"
                                          OnClick="AddBranch_Click" ValidationGroup="CompanyBranch" />

                                      <div class="table-responsive mt-2">
                                          <asp:GridView ID="GridView1" runat="server" DataKeyNames="BranchID"
                                              Width="100%"
                                              CssClass="table table-borderless"
                                              HorizontalAlign="Center"
                                              BackColor="White" BorderStyle="None"
                                              ForeColor="#333333"
                                              AutoGenerateColumns="False"
                                              EmptyDataText="لا يوجد فروع"
                                              OnRowCommand="GridView1_RowCommand">
                                              <Columns>
                                                  <asp:BoundField DataField="BranchID" HeaderText="التسلسل">
                                                      <ItemStyle></ItemStyle>
                                                  </asp:BoundField>
                                                  <asp:BoundField DataField="Placename" HeaderText="الفرع">
                                                      <ItemStyle></ItemStyle>
                                                  </asp:BoundField>

                                                  <asp:ButtonField ButtonType="Image" CommandName="DeleteRow" ImageUrl="~/Asset/img/Delete.png" Text="حذف" />
                                              </Columns>



                                              <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                              <RowStyle BackColor="White" BorderStyle="Solid" BorderWidth="1px" />
                                              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                              <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                              <SortedAscendingHeaderStyle BackColor="#808080" />
                                              <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                              <SortedDescendingHeaderStyle BackColor="#383838" />

                                              <HeaderStyle ForeColor="#1277a7" Font-Bold="true" CssClass="TableHeader" Font-Size="x-small" />
                                              <RowStyle BackColor="#FFFFFFF" ForeColor="#333333" HorizontalAlign="Center" Font-Size="x-small" Font-Bold="true" BorderColor="White" />
                                          </asp:GridView>

                                          <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                              ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                              SelectCommand="SELECT [BranchID], [Placename] FROM [Branches] WHERE ([Company_No] = @Company_No) ORDER BY [BranchID]">
                                              <SelectParameters>
                                                  <asp:SessionParameter Name="Company_No" SessionField="compno" Type="Int32" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                      </div>
                                  </div>

                                  
                              </div>
                            </div>

                    
                                  <div>
                                      <asp:Label ID="Label19" runat="server" CssClass="form-label mb-2" Text="صورة كتاب التفويض بالتوقيع"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <div class="container">
                                          <asp:FileUpload ID="CompSignDelFile" CssClass="form-control mb-4" runat="server"  />
                                      </div>
                                      <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                                  </div>
                                  <div>
                                      <asp:Label ID="Label20" runat="server" CssClass="form-label mb-2" Text="شهادة تسجيل الشركة"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <div class="container">
                                          <asp:FileUpload ID="CompRegisterFile" CssClass="form-control mb-4" runat="server" />
                                      </div>
                                       <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
                                  </div>
                                  <div>
                                      <asp:Label ID="Label21" runat="server" CssClass="form-label mb-2" Text="رخصة مهن سارية المفعول"
                                          Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <div class="container">
                                          <asp:FileUpload ID="CompCertFile" CssClass="form-control mb-4" runat="server" />
                                      </div>
                                   <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                                  </div>
                                  <div>
                                      <asp:CheckBox ID="chkApprove" runat="server" 
                                          Text=" - اقر انا معبئ الطلب أن جميع المعلومات المعبأة بهذا الطلب صحيحة، واتحمل مسؤولية اي خطأ" Checked="true"  />
                                  </div>

                                
                              </div>
                      </div>
               
          </div>
      </div>

  </section>
</asp:Content>
