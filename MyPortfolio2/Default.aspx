<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyPortfolio2.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/portfolio.js"></script>

    <!-- Hero Section -->
    <section id="home" class="hero-section">
        <div class="container">
            <div class="hero-content">
                <!-- Left Side -->
                <div class="hero-text">
                    <h1 class="hero-title">
                        Hi, I’m <span class="highlight">Torikul Islam</span>
                    </h1>
                    <h2 class="hero-subtitle">
                        Software Developer & Machine Learning Enthusiast
                    </h2>
                    <p class="hero-description">
                        I build modern web, desktop, and mobile applications. 
                        Passionate about AI, software engineering, and creating impactful solutions.
                    </p>
                    <div class="hero-buttons">
                        <a href="#projects" class="btn btn-primary">View My Work</a>
                        <a href="Files/Torikul_Islam_CV.pdf" class="btn btn-secondary" download>Download CV</a>
                    </div>
                </div>

                <!-- Right Side -->
                <div class="hero-image">
                    <div class="profile-card">
                        <img src="Images/Torikul_Islam.jpg" alt="Profile Picture" class="profile-img" />
                        <div class="profile-glow"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">About Me</h2>
            </div>
            <div class="about-content">
                <p class="about-intro">
                    Hi, I’m Torikul Islam, a passionate Software Developer and Machine Learning Enthusiast. 
                    I specialize in designing and developing modern, scalable, and responsive applications. 
                    My academic and project experiences have shaped my skills in AI, web technologies, and 
                    problem-solving, allowing me to create impactful solutions.
                </p>
            </div>
        </div>
    </section>

    <!-- Education Section -->
    <section id="education" class="education-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Education</h2>
            </div>
            <div class="education-timeline">
                <div class="education-item">
                    <div class="education-year">Ongoing</div>
                    <div class="education-degree">Bachelor of Computer Science & Engineering</div>
                    <div class="education-school">Khulna University of Engineering & Technology (KUET)</div>
                    <div class="education-details">
                        Focused on Artificial Intelligence, Software Development, and Research in Machine Learning, with practical experience in data analysis, algorithm design, and building intelligent applications.
                    </div>
                </div>
                <div class="education-item">
                    <div class="education-year">2021</div>
                    <div class="education-degree">Higher Secondary Certificate (Science)</div>
                    <div class="education-school">Kushtia Govt. College,Kushtia</div>
                    <div class="education-details">
                        Jessore Board<br />
                        <span class="education-gpa">GPA: 5.00</span>
                    </div>
                </div>
                <div class="education-item">
                    <div class="education-year">2019</div>
                    <div class="education-degree">Secondary School Certificate (Science)</div>
                    <div class="education-school">Boalia High School,Doulatpur,Kushtia</div>
                    <div class="education-details">
                        Jessore Board<br />
                        <span class="education-gpa">GPA: 5.00</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Skills Section -->
    <section id="skills" class="skills-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">My Skills</h2>
            </div>
            <div class="skills-grid">
                <div class="skill-category">
                    <h3>Programming Languages & Core Technologies</h3>
                    <asp:Repeater ID="rptLanguageSkills" runat="server">
                        <ItemTemplate>
                            <div class="skill-item">
                                <div class="skill-header">
                                    <span class="skill-name"><%# Eval("SkillName") %></span>
                                    <span class="skill-percentage"><%# GetProficiencyPercentage(Eval("Proficiency").ToString()) %>%</span>
                                </div>
                                <div class="skill-progress">
                                    <div class="progress-fill" data-level="<%# GetProficiencyPercentage(Eval("Proficiency").ToString()) %>"></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
              
               
            </div>
        </div>
    </section>

    <!-- Projects Section -->
    <section id="projects" class="projects-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">My Projects</h2>
                <p class="section-subtitle">Here are some of my recent works</p>
            </div>
            <div class="projects-grid">
                <asp:Repeater ID="rptProjects" runat="server">
                    <ItemTemplate>
                        <div class="project-card">
                            <div class="project-image">
                                <img src='<%# !string.IsNullOrEmpty(Eval("image_path").ToString()) ? Eval("image_path") : "~/Images/default-project.jpg" %>' 
                                     alt='<%# Eval("title") %>' />
                                <div class="project-overlay">
                                    <div class="project-links">
                                        <%# !string.IsNullOrEmpty(Eval("website_url").ToString()) ? 
                                            "<a href='" + Eval("website_url") + "' target='_blank' class='project-link'>Live Demo</a>" : "" %>
                                        <%# !string.IsNullOrEmpty(Eval("github_url").ToString()) ? 
                                            "<a href='" + Eval("github_url") + "' target='_blank' class='project-link'>Source Code</a>" : "" %>
                                    </div>
                                </div>
                            </div>
                            <div class="project-content">
                                <h3 class="project-title"><%# Eval("title") %></h3>
                                <p class="project-description"><%# Eval("short_description") %></p>
                                <div class="project-tech">
                                    <%# FormatTechnologies(Eval("technologies").ToString()) %>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Contact Me</h2>
            </div>
           
                <div class="contact-form">
                    <asp:Panel ID="pnlContactMessage" runat="server" Visible="false">
                        <div class="contact-message">
                            <asp:Label ID="lblContactMessage" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                    
                    <div class="form-group">
                        <asp:TextBox ID="txtContactName" runat="server" CssClass="form-input" placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtContactEmail" runat="server" CssClass="form-input" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtContactSubject" runat="server" CssClass="form-input" placeholder="Subject"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtContactMessage" runat="server" CssClass="form-input" 
                            TextMode="MultiLine" Rows="5" placeholder="Message"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnSendMessage" runat="server" CssClass="btn btn-primary" 
                            Text="SEND NOW" OnClick="btnSendMessage_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
