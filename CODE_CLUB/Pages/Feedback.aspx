<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Pages_Feedback" %>


<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section feedback-section">
    <div class="section-label">// FEEDBACK</div>
    <div class="feedback-inner">
      <h2 class="section-title">Share Your Thoughts</h2>
      <p>Your feedback helps us improve. We read every message.</p>

      <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
        <div class="form-message success">✓ Thank you for your feedback!</div>
      </asp:Panel>

      <asp:Panel ID="pnlForm" runat="server">

        <div class="rating-bar">
          <span>Rate your experience:</span>
          <div class="stars" id="starRating">
            <span class="star" data-val="1">★</span>
            <span class="star" data-val="2">★</span>
            <span class="star" data-val="3">★</span>
            <span class="star" data-val="4">★</span>
            <span class="star" data-val="5">★</span>
          </div>
        </div>
       
        <asp:HiddenField ID="hdnRating" runat="server" Value="0" />

        <div class="form-row">
          <div class="form-group">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-input" placeholder="Your name" />
            <asp:RequiredFieldValidator ControlToValidate="txtName" ErrorMessage="Name required."
              CssClass="field-error" Display="Dynamic" runat="server" />
          </div>
          <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-input" placeholder="your@email.com" />
            <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Email required."
              CssClass="field-error" Display="Dynamic" runat="server" />
          </div>
        </div>
        <div class="form-group">
          <label>Feedback</label>
          <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine"
                       Rows="4" CssClass="form-input" placeholder="Share your thoughts..." />
          <asp:RequiredFieldValidator ControlToValidate="txtFeedback" ErrorMessage="Feedback required."
            CssClass="field-error" Display="Dynamic" runat="server" />
        </div>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback"
                    CssClass="btn btn-primary btn-full" OnClick="btnSubmit_Click" />
      </asp:Panel>

    </div>
  </section>


  <script>
    (function () {
      var stars  = document.querySelectorAll('.star');
      var hidden = document.getElementById('<%= hdnRating.ClientID %>');
      var rating = 0;

      stars.forEach(function (s) {
        s.addEventListener('mouseover', function () {
          stars.forEach(function (x, i) {
            x.classList.toggle('active', i < s.dataset.val);
          });
        });
        s.addEventListener('mouseleave', function () {
          stars.forEach(function (x, i) {
            x.classList.toggle('active', i < rating);
          });
        });
        s.addEventListener('click', function () {
          rating = parseInt(s.dataset.val);
          hidden.value = rating;
          stars.forEach(function (x, i) {
            x.classList.toggle('active', i < rating);
          });
        });
      });
    })();
  </script>

</asp:Content>

