library(shiny)
library(dplyr)
library(stringr)
library(png)
library(shinyjs)
library(DT)
library(visNetwork)
library(rintrojs)
library(shinydashboard)
library(sodium)

source("carouselPanel.R")

panel_div <- function(class_type, content) {
    div(class = sprintf("panel panel-%s", class_type),
        div(class = "panel-body", content)
    )
}

shinyUI(navbarPage(title = img(src="Logo.jfif", height = "40px"), id = "navBar",
                   theme = "paper.css",
                   collapsible = TRUE,
                   inverse = TRUE,
                   windowTitle = "Jobiffy", 
                   position = "fixed-top",
                   footer = includeHTML("./www/include_footer.html"),
                   header = tags$style(
                       ".navbar-right {
                       float: right !important;
                       }",
                       "body {padding-top: 75px;}"),
           
                   
                   
                  
            tabPanel("HOME", value = "home",
                            
                            shinyjs::useShinyjs(),
                            
                            tags$head(tags$script(HTML('
                                                       var fakeClick = function(tabName) {
                                                       var dropdownList = document.getElementsByTagName("a");
                                                       for (var i = 0; i < dropdownList.length; i++) {
                                                       var link = dropdownList[i];
                                                       if(link.getAttribute("data-value") == tabName) {
                                                       link.click();
                                                       };
                                                       }
                                                       };
                                                       '))),
                            fluidRow(
                                HTML("
                                     
                                     <section class='banner'>
                                     <h2 class='parallax'>Karyarat</h2>
                                     <p class='parallax_description'>Karyarat pinpoints your next job, the job
                                     after that, and beyond.It maybe would be your the most trustful friend in your career.</p>
                                     </section>
                                     ")
                            ),
                            
                     
                            # WHAT
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>What's there in the store for you</h1> </center><br>"),
                                       shiny::HTML("<h5>An interactive tool to help you explore the actual paths employees have taken during 
                                                   their County careers. With information about the popularity of certain paths, 
                                                   salary differences, and more, you can build your own path based on what is meaningful to you.</h5>")
                                ),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # HOW
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>How it is going to Assist you</h1> </center><br>"),
                                       shiny::HTML("<h5>With most things, the more you know, the better your decisions will be.
                                                   The Karyarat empowers you to make better decisions about a County career by being
                                                   transparent about probable and possible career progressions here.</h5>")
                                ),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # WHERE
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>Our Origin</h1> </center><br>"),
                                       shiny::HTML("<h5>Our team analyzed over 500 thousand County employee records from the
                                                   past 30 years and transformed them into the information you will see in the
                                                   karyarat.</h5>")
                                ),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # HOW TO START
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>Ready to start this journey?</h1> </center><br>"),
                                       shiny::HTML("<h5>To launch the Karyarat, choose one of the options below.
                                                   You will not be asked to provide any identifiable information, and you 
                                                   can revisit the jobiffy to chart a different course for yourself as
                                                   needs arise.</h5>")
                                ),
                                column(3)
                            ),
                            
                            # BUTTONS TO START
                            fluidRow(
                                column(3),
                                column(6,
                                       
                                       tags$div(class = "wrap",
                                                div(class = "center", 
                                                    style="display: inline-block;vertical-align:top; width: 225px;",
                                                    tags$a("I need help finding a starting job to explore and kickstart my career",
                                                           onclick = "window.open('https://www.governmentjobs.com/careers/lacounty/classspecs', '_blank')",
                                                           class="btn btn-primary btn-lg")
                                                ),
                                                div(class = "center",
                                                    style="display: inline-block; vertical-align:top; horizontal-align:middle; width: 75px;",
                                                    tags$br(), tags$h4("OR") ),
                                                div(class = "center",
                                                    style="display: inline-block;vertical-align:top; width: 225px;",
                                                    tags$a(" I have a starting job I would like to explore more about other domains and jobs i find interest in.", 
                                                           onclick="fakeClick('careerPF')", 
                                                           class="btn btn-primary btn-lg")
                                                )
                                       )
                                ),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # INSTRUCTIONAL SECTION
                            fluidRow(
                                shiny::HTML("<br><br><center> <h1>Career Planning Made Easy.</h1> </center>
                                            <br>")
                            ),
                            
                            fluidRow(
                                column(3),
                                
                                column(2,
                                       div(class="panel panel-default", 
                                           div(class="panel-body",  width = "600px",
                                               align = "center",
                                               div(
                                                   tags$img(src = "one.svg", 
                                                            width = "50px", height = "50px")
                                               ),
                                               div(
                                                   h5(
                                                       "Pick a job to start your path. You may use your current job, or a job you're interested in exploring."
                                                   )
                                               )
                                           )
                                       )
                                ),
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px", 
                                               align = "center",
                                               div(
                                                   tags$img(src = "two.svg", 
                                                            width = "50px", height = "50px")
                                               ),
                                               div(
                                                   h5(
                                                       "Then from that job, review the set of next jobs that people have moved into during their careers. Review information about these choices and select your next career step."
                                                   )
                                               )
                                           )
                                       )
                                ),
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px", 
                                               align = "center",
                                               div(
                                                   tags$img(src = "three.svg", 
                                                            width = "50px", height = "50px")),
                                               div(
                                                   h5(
                                                       "Plan up to five steps in advance in your career. When you believe you're ready after all the exploration and searching and wish to chart out a plan, you may save or print out your personalized report."
                                                   )
                                               )
                                           )
                                       )
                                ),
                                column(3)
                                
                            ),
                            
                            fluidRow(
                               
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            # AFTERWARD
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h1>What are our future prospects and how its linked with it?</h1> </center><br>"),
                                       shiny::HTML("<h5>Building this site is just one part of effective career planning and development. You should also establish
                                       a career plan to outline how you will achieve your professional goals. Our Career
                                       Planning Guide provides information to help you establish a plan for making your
                                       career path a reality.</h5>")
                                ),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            # PAGE BREAK
                            tags$hr(),
                            
                            fluidRow(shiny::HTML("<br><br><center> <h1>Ready to Get Started?</h1> </center>
                                                 <br>")
                            ),
                            fluidRow(
                                column(3),
                                column(6,
                                       tags$div(align = "center", 
                                                tags$a("Start", 
                                                       onclick="fakeClick('careerPF')", 
                                                       class="btn btn-primary btn-lg")
                                       )
                                ),
                                column(3)
                            ),
                            fluidRow(style = "height:25px;"
                            )
                         
                   ), # Closes the first tabPanel called "Home"
                   
                   tabPanel("PATHFINDER", value = "careerPF",
                            
                            sidebarLayout( 
                                
                                sidebarPanel( width = 3,
                                              introjsUI(),
                                              
                                              tags$div(
                                                  actionButton("help", "Take a Quick Tour"),
                                                  style = "height:50px;"
                                              ),
                                              useShinyjs(),
                                              
                                              tags$div(
                                                  style = "height:50px;",
                                                  introBox(
                                                      tags$div(
                                                          style = "height:50px;",
                                                          actionLink("settings", "Settings", 
                                                                     icon = icon("sliders", class = "fa-2x"))),
                                                      data.step = 6,
                                                      data.intro = "Settings is where you can set options that affect the graph and career statistics."
                                                  ),
                                                  radioButtons("selectData", 
                                                               label = "How many years of data do you want to include?",
                                                               choices = c("30 Years",
                                                                           "15 Years"),
                                                               inline = TRUE,
                                                               width = "100%"
                                                  ),
                                                  selectizeInput("changeAvatar", "Change Icon:",
                                                                 choices = c(
                                                                     # "Traveler" = "traveler",  # not compatible with new FA
                                                                     "Map Marker" = "map-marker", 
                                                                     "Rocket" = "rocket", 
                                                                     # "Paper Plane" = "paper-plane",  # not compatible with new FA
                                                                     "Leaf" = "leaf"),
                                                                 selected = "rocket"
                                                  ),
                                                  textInput("userName", "Add your name:", value = ""),
                                                  
                                                  tags$div(
                                                      style = "height:50px;",
                                                      
                                                      uiOutput("printInput1"),
                                                      uiOutput("printInput2"),
                                                      uiOutput("printInput3"),
                                                      uiOutput("printInput4"),
                                                      uiOutput("printInput5")
                                                  )
                                              )
                                ),  # Closes sidebarPanel
                                mainPanel( width = 8,
                                           fluidRow(
                                               
                                               tags$style(type="text/css",
                                                          ".shiny-output-error { visibility: hidden; }",
                                                          ".shiny-output-error:before { visibility: hidden; }"
                                               ),
                                               introBox(
                                                   panel_div(class_type = "default",
                                                             content = tags$div(
                                                                 uiOutput("displayName"),
                                                                 visNetwork::visNetworkOutput("visTest", height = "200px")
                                                             )
                                                   ),
                                                   data.step = 4,
                                                   data.intro = "Your selections will be displayed here in a graph."
                                               )
                                           ),
                                           fluidRow(
                                               div(class="panel panel-default",
                                                   div(class="panel-body",  width = "600px",
                                                       tags$div(class = "wrap",
                                                                div(class = "left", 
                                                                    style="display: inline-block;vertical-align:top; width: 150px;",
                                                                    uiOutput("stepNo")
                                                                ),
                                                                div(class = "right",
                                                                    style="display: inline-block;vertical-align:top; width: 150px;",
                                                                    
                                                                    introBox(
                                                                        
                                                                        checkboxInput('returnpdf', 'Dwonload the Form', TRUE),
                                                                        data.step = 5, data.intro = "Stay on track with your plans by downloading your path."
                                                                        
                                                                    ),
                                                                    uiOutput("download")
                                                                ),
                                                                div(class = "center",
                                                                    style="display: inline-block;vertical-align:top; width: 150px;",
                                                                    introBox(
                                                                        actionButton("goBack", 
                                                                                     label = "Back", 
                                                                                     icon = icon("arrow-circle-left", class = "fa-2x"),
                                                                                     width= "100px", height= "40px"),
                                                                        data.step = 3,
                                                                        data.intro = "Go back a step to edit your selection anytime."
                                                                    )
                                                                ),
                                                                # div(style="display: inline-block;vertical-align:top; width: 150px;",
                                                                #     uiOutput("clearBtns")
                                                                # ),
                                                                # actionButton("resetBtn", "Reset All", icon = icon("refresh", class = "fa-2x")),    
                                                                div(class = "center",
                                                                    style="display: inline-block;vertical-align:top; width: 150px;",
                                                                    introBox(
                                                                        actionButton("btn1", 
                                                                                     label = "Add", 
                                                                                     icon = icon("arrow-circle-right", class = "fa-2x"),
                                                                                     width= "100px", height= "40px"),
                                                                        data.step = 2,
                                                                        data.intro = "Confirm your selection by clicking here."
                                                                    )
                                                                )
                                                       ),
                                                       # Insert Table Output
                                                       introBox(
                                                           uiOutput("btns"),
                                                           data.step = 1, 
                                                           data.intro = "Start by selecting your first career choice from our list of over 2,000 current job classifications."
                                                       )
                                                   )
                                               ),
                                               plotOutput("myplot")
                                           )
                                )  # Closes the mainPanel
                            )  # Closes the sidebarLayout
                   ),  # Closes the second tabPanel called "Jobbify"
                   
                   tabPanel("ABOUT", value = "about",
                            
                            fluidRow(
                                shiny::HTML("<br><br><center> 
                                            <h1>About Karyarat</h1> 
                                            </center>
                                            <br>
                                            <br>"),
                                style = "height:250px;"),
                            fluidRow(
                                div(align = "center",
                                    tags$span(h4("Our Story of Karyarat So Far"), 
                                              style = "font-weight:bold"
                                    ))
                            ),
                            fluidRow(
                                column(3),
                                column(6,
                                       tags$ul(
                                           tags$li(h6("The need for the Karyarat grew out of the fact that it is simply difficult to navigate the classification structure if you do not already know it or know someone who has gone through it.")), 
                                           tags$li(h6("The Workforce and Employee Development team wanted to help others help themselves by providing an online tool that sheds light on the otherwise invisible career paths in the County.")), 
                                           tags$li(h6("Now, and into the future, we want to be a magnet for top talent and be an employer of choice."))
                                       )
                                ),
                                column(3)
                            ),
                            
                            # TEAM BIO
                            fluidRow(
                                column(3),
                                column(6,
                                       shiny::HTML("<br><br><center> <h5>About the team</h5> </center><br>")
                                       
                                ),
                                column(3)
                            ),
                            
                            fluidRow(
                                
                                style = "height:50px;"),
                            
                            fluidRow(
                                column(2),
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px", 
                                               align = "center",
                                               div(
                                                   tags$img(src = "man.svg", 
                                                            width = "50px", height = "50px")
                                               ),
                                               div(
                                                   tags$h5("Devansh Goel"),
                                                   tags$h6( tags$i(" "))
                                               ),
                                               
                                           )
                                       )
                                ),
                                
                                
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px", 
                                               align = "center",
                                               div(
                                                   tags$img(src = "man.svg", 
                                                            width = "50px", height = "50px")
                                               ),
                                               div(
                                                   tags$h5("Dipankur lawaria"),
                                                   tags$h6( tags$i(" "))
                                               ),
                                               
                                           )
                                       )
                                ),
                                
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px", 
                                               align = "center",
                                               div(
                                                   tags$img(src = "man.svg", 
                                                            width = "50px", height = "50px")),
                                               div(
                                                   tags$h5("Abhishek Soni"),
                                                   tags$h6( tags$i(" "))
                                               ),
                                               
                                           )
                                       )
                                ),
                                column(2,
                                       div(class="panel panel-default",
                                           div(class="panel-body",  width = "600px", 
                                               align = "center",
                                               div(
                                                   tags$img(src = "man.svg", 
                                                            width = "50px", height = "50px")
                                               ),
                                               div(
                                                   tags$h5("Karthikeyan"),
                                                   tags$h6( tags$i(" "))
                                               ),
                                               
                                           )
                                       )
                                ),
                                
                                column(3)
                                
                            ),
                            fluidRow(style = "height:150px;")
                   )  
                   
                       
                   
                   )
        

)




