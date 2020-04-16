<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LXD_LessonPlan.aspx.cs" Inherits="LXD_Lesson_Plan.LXD_LessonPlan" ValidateRequest="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width">
    <!-- The above 4 meta tags Must come first in the head; any other head content must come after these tags -->

    <!-- Title -->
    <title>LXD</title>

    <!-- Favicon -->

    <!-- Stylesheet -->
    <link href="Stylesheet/style.css" rel="stylesheet" />
    <link href="Stylesheet/timeline.css" rel="stylesheet" />

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- // Fonts -->

    <!-- Include stylesheet -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

    <!-- For duration picker -->

    <!-- For tooltip -->


    <style>
        p:empty:not(:focus)::before {
            content: attr(data-placeholder);
        }

        .headerDiv:empty:not(:focus)::before {
            content: attr(data-placeholder);
        }

        textarea {
            max-height: 100%;
        }

        .headersNotes:empty:not(:focus)::before {
            content: attr(data-placeholder);
        }

        .headerForEvent:empty:not(:focus)::before {
            content: attr(data-placeholder);
        }

        /*#loaderForNewNotes {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 150px;
            height: 150px;
            margin: -75px 0 0 -75px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }*/

        .loader {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 150px;
            height: 150px;
            margin: -75px 0 0 -75px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        #creatingNoteLabel {
            position: absolute;
            left: 50%;
            top: 50%;
            width: 150px;
            height: 150px;
            margin: -100px 0 0 -75px;
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        .secondLoader {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 150px;
            height: 150px;
            margin: -75px 0 0 -75px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        #creatingEventLabel {
            position: absolute;
            left: 50%;
            top: 50%;
            width: 150px;
            height: 150px;
            margin: -100px 0 0 -75px;
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        .loaderSecond {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 150px;
            height: 150px;
            margin: -75px 0 0 -75px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        #deleteNote {
            position: absolute;
            top: 50%;
            left: 25%;
            color: white;
        }

        #keepNote {
            position: absolute;
            top: 50%;
            left: 68%;
            color: white;
        }

        #deleteEvent {
            position: absolute;
            top: 50%;
            left: 25%;
            color: white;
        }

        #keepEvent {
            position: absolute;
            top: 50%;
            left: 68%;
            color: white;
        }

        #overlay {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 2;
            cursor: pointer;
        }

        #overlayForNotes {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 2;
            cursor: pointer;
        }

        #overlayForJSON {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 2;
            cursor: pointer;
        }

        #overlayForDeletingNotes {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 2;
            cursor: pointer;
        }

        #overlayForDeletingEvents {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 2;
            cursor: pointer;
        }

        .text {
            position: absolute;
            top: 30%;
            left: 50%;
            font-size: 50px;
            color: white;
            transform: translate(-50%,-50%);
            -ms-transform: translate(-50%,-50%);
        }

        .timeline-article .meta-date .date {
            font-size: 21px;
            line-height: 20px;
        }

        .timeline-article .meta-date .month {
            font-size: 12px;
            line-height: 10px;
        }

        .timeline-article .meta-date {
            position: absolute;
            top: 0;
            left: 48.25%;
            width: 95px;
            height: 62px;
            margin-left: -31px;
            color: #fff;
            border-radius: 15px;
            background: #00b0bd;
        }

            .timeline-article .meta-date .date,
            .timeline-article .meta-date .month {
                display: block;
                text-align: center;
                font-weight: 900;
                padding-top: 20px;
            }
    </style>
    <script src="scripts/tinymce/tinymce.min.js"></script>

    <!-- Include the Quill library -->

    <!-- For CKEditor -->

    <!-- For tiny -->
    <script src="https://cdn.tiny.cloud/1/s10q09jxylitz9oiyw1l72vaooxgiiygcnpr4kwryw6uemns/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

</head>

<body onclick="checkIndexOfDurationInput();">
    <form id="myForm" runat="server">
        
        <!-- Preloader -->
        <div id="preloader">
            <div class="spinner"></div>
        </div>

        <!-- ##### Header Area Start ##### -->
        <header class="header-area">

            <!-- Navbar Area -->
            <div class="clever-main-menu">
                <div class="classy-nav-container breakpoint-off">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="cleverNav">

                        <!-- Logo -->
                        
                        <a class="nav-brand">LXD Lesson Plan</a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="#lxdcards">LXD Cards</a></li>
                                    <li><a href="#lxdtimeline">LXD Timeline</a></li>
                                    <li><a href="#lxdsave">Save to XML</a></li>
                                </ul>



                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <!-- ##### Header Area End ##### -->

        <!-- For Browsing Button -->
        <section class="popular-courses-area section-padding-100" runat="server" id="browseSection">
            <div class="container" runat="server">

                <div class="row">
                    <div class="col-12">
                        <div class="load-more text-center wow fadeInUp" data-wow-delay="1000ms">
                            
                            <input id="myFile" type="file" accept=".json" style="margin-left: 80px" />
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-12">
                        <div class="load-more text-center wow fadeInUp" data-wow-delay="1000ms">
                            
                            <button type="button" id="show" disabled="disabled" class="btn clever-btn btn-2" style="color: rgba(0, 0, 0, 0.50)">Display Data</button>
                            <div id="content"></div>
                            
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- ##### LXD CARDS Catagory ##### -->
        <div class="clever-catagory bg-img d-flex align-items-center justify-content-center p-3" style="background-image: url(Stylesheet/img/bg2.jpg);" id="lxdcards">
            <h3>LXD CARDS</h3>
        </div>

        <!-- ##### Popular Course Area Start ##### -->
        <section class="popular-courses-area section-padding-100" id="ControlContainer" runat="server">
            <div class="container" runat="server">
                <div class="row" runat="server" id="rowForNotes">

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv1">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #0080ff" id="divForNC1">
                                <h4 contenteditable="true" id="headerForNotes1" class="headersNotes" data-placeholder="Title...">Learning Outcomes</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color1" name="colorPicker" value="#0080ff" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn1" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>

                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea1" name="goTextArea"></textarea>

                            </div>
                            <!-- Seat Rating Fee -->

                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv2">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #ffff00" id="divForNC2">
                                <h4 contenteditable="true" id="headerForNotes2" class="headersNotes" data-placeholder="Title...">Learning Objectives</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color2" name="colorPicker" value="#ffff00" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn2" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea2" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv3">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #80ff00" id="divForNC3">
                                <h4 contenteditable="true" id="headerForNotes3" class="headersNotes" data-placeholder="Title...">People</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color3" name="colorPicker" value="#80ff00" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn3" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea3" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv4">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #00ffff" id="divForNC4">
                                <h4 contenteditable="true" id="headerForNotes4" class="headersNotes" data-placeholder="Title...">Characteristics</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color4" name="colorPicker" value="#00ffff" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn4" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea4" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv5">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #ff0000" id="divForNC5">
                                <h4 contenteditable="true" id="headerForNotes5" class="headersNotes" data-placeholder="Title...">Strategy</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color5" name="colorPicker" value="#ff0000" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn5" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea5" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv6">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #00ff40" id="divForNC6">
                                <h4 contenteditable="true" id="headerForNotes6" class="headersNotes" data-placeholder="Title...">Environment</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color6" name="colorPicker" value="#00ff40" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn6" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea6" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv7">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #ff80ff" id="divForNC7">
                                <h4 contenteditable="true" id="headerForNotes7" class="headersNotes" data-placeholder="Title...">Location</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color7" name="colorPicker" value="#ff80ff" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn7" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea7" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv8">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #ff8040" id="divForNC8">
                                <h4 contenteditable="true" id="headerForNotes8" class="headersNotes" data-placeholder="Title...">Constraints</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color8" name="colorPicker" value="#ff8040" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn8" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea8" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv9">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #808040" id="divForNC9">
                                <h4 contenteditable="true" id="headerForNotes9" class="headersNotes" data-placeholder="Title...">Resources</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color9" name="colorPicker" value="#808040" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn9" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea9" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv10">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #8080ff" id="divForNC10">
                                <h4 contenteditable="true" id="headerForNotes10" class="headersNotes" data-placeholder="Title...">Activities</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color10" name="colorPicker" value="#8080ff" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn10" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea10" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                    <!-- Single Popular Course -->
                    <div class="col-12 col-md-12 col-lg-6" style="width: 470px" id="bigDiv11">
                        <div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="100ms" style="width: 470px">
                            <!-- Course Content -->
                            <div class="course-content" style="width: 470px; background-color: #ff0080" id="divForNC11">
                                <h4 contenteditable="true" id="headerForNotes11" class="headersNotes" data-placeholder="Title...">Process</h4>
                                <input title="Use this button to change the color of the note" type="color" id="color11" name="colorPicker" value="#ff0080" />
                                <button title="Use this button to delete this note" type="button" name="goRemoveNotes" id="removeBtn11" style="float: right; width: 50px"><i class="fa fa-trash" style="font-size: 18px"></i></button>
                                <hr>
                                
                                <textarea contenteditable="true" data-placeholder="Your notes" style="width: 420px; height: 300px" id="textArea11" name="goTextArea"></textarea>
                                
                            </div>
                            <!-- Seat Rating Fee -->
                            
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="load-more text-center wow fadeInUp" data-wow-delay="1000ms" id="divForAddNoteBtn">
                           
                            <input title="Use this button to add a new note" type="button" value="Add New Note" class="btn clever-btn btn-2" id="addNoteBtn" style="color: rgba(0, 0, 0, 0.50)" />
                        </div>
                        
                    </div>
                    
                </div>
            </div>

        </section>

        <!-- ##### Popular Course Area End ##### -->
        <!-- ##### LXD CARDS Catagory End ##### -->

        <!-- ##### LXD TIMELINE Catagory ##### -->
        <div class="clever-catagory bg-img d-flex align-items-center justify-content-center p-3" style="background-image: url(Stylesheet/img/bg2.jpg);" id="lxdtimeline">
            <h3>LXD TIMELINE</h3>
        </div>

        <!-- Vertical Timeline -->
        <section id="conference-timeline">
            <div class="timeline-start">Start</div>
            <div class="conference-center-line"></div>
            <div class="conference-timeline-content" id="containerBox">
                <!-- Article -->

                <div class="timeline-article" id="eventSet1">

                    <div class="content-left-container">
                        
                        <div class="content-left" id="divForCPE1" style="background-color: #8080ff">
                            
                            <h4 contenteditable="true" id="uniqueheaderForEvent1" class="headerForEvent" data-placeholder="Title..."></h4>
                            <textarea contenteditable="true" style="height: 400px" id="textAreaSet1" name="textAreasForEvents">

                                </textarea>
                            

                            <input title="Use this button to change the color of the note" type='color' id='colorForEvent1' name="colorPickerForEvent" value="#8080ff" />
                            
                        </div>

                        <label>Duration:</label><br />
                        <input id="addDurationInput1" type="number" name="goDuration" style="width: 50px" min="0" max="23" />&nbsp<label>hour(s)</label>&nbsp<input id="addMinutesInput1" type="number" name="goMinutes" style="width: 50px" min="0" max="59" />&nbsp<label>minute(s)</label>
                        <br />
                        <label>Start Time:</label>
                        <br />
                        <input name="goTime" type="time" id="inputForStartTime1" />
                        
                    </div>
                    <div class="content-right-container">
                        <div class="content-right" id="divForCPE2" style="background-color: #80ff00">
                            
                            <h4 contenteditable="true" id="uniqueheaderForEvent2" class="headerForEvent" data-placeholder="Title..."></h4>
                            <textarea contenteditable="true" style="height: 400px" id="textAreaSet2" name="textAreasForEvents">

                                </textarea>
                            
                            <input title="Use this button to change the color of the note" type='color' id='colorForEvent2' name="colorPickerForEvent" value="#80ff00" />
                            
                        </div>
                        
                    </div>
                    <div class="meta-date">
                        <span class="date" id="circleForEvent1">0 h 0 m</span>
                        
                    </div>
                    <button title="Use this button to delete that specific event (This event cannot be deleted as the timeline needs to have at least 1 event)" type="button" name="goRemoveEvents" id="removeEventBtn1" class="btn clever-btn btn-2" style="display: block; margin-left: auto; margin-right: auto; margin-bottom: 50px; margin-top: 300px; cursor: not-allowed" disabled><i class="fa fa-trash" style="font-size: 18px;"></i></button>
                    <input title="Use this button to add an event" type="button" value="+" class="btn clever-btn btn-2" id="addEventBtn1" name="goButton" style="display: block; margin-left: auto; margin-right: auto; background: #00b0bd; color: rgba(0, 0, 0, 0.50); font-size: xx-large; margin-top: 300px" />
                    
                </div>

                <!-- // Article -->

                <!-- Article -->
               
                <!-- // Article -->

                <!-- Article -->
                
                <!-- // Article -->
            </div>

            <div class="timeline-end">End</div>
            
        </section>
        <!-- // Vertical Timeline -->

        <!-- ##### LXD TIMELINE Catagory End ##### -->

        <!-- ##### LXD CARDS Catagory ##### -->
        <div class="clever-catagory bg-img d-flex align-items-center justify-content-center p-3" style="background-image: url(Stylesheet/img/bg2.jpg);" id="lxdsave">
            <h3>SAVE TO JSON FILE</h3>
        </div>

        <!-- ##### Popular Course Area Start ##### -->
        <section class="popular-courses-area section-padding-100" id="Section1" runat="server">
            <div class="container" runat="server">

                <div class="row">
                    <div class="col-12">
                        <div class="load-more text-center wow fadeInUp" data-wow-delay="1000ms" id="divForSaveToXmlBtn">
                            <label>Name of file to save as:</label>&nbsp
                            <input type="text" id="nameOfJSONFile" />
                            <br />
                            
                            <button title="Use this button to save your contents into a json file" type="button" value="Save To JSON File" class="btn clever-btn btn-2" id="saveToJSONBtn" onclick="saveToJSON()" disabled="disabled" style="color: rgba(0, 0, 0, 0.50)">Save to JSON File</button>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- ##### Footer Area Start ##### -->
        <footer class="footer-area">
            <!-- Top Footer Area -->
            <div class="top-footer-area">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <!-- Footer Logo -->
                            <div class="footer-logo">
                                <a href="LXD_LessonPlan.aspx" style="font-size: 20px; color: white">LXD Lesson Plan</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </footer>

        <div id="overlayForNotes">
            <div class="text">Adding New Note...</div>
            <div class="loaderSecond"></div>
        </div>

        <div id="overlay">
            <div class="text">Adding New Event...</div>
            <div class="loaderSecond"></div>
        </div>

        <div id="overlayForJSON">
            <div class="text">Displaying data...</div>
            <div class="loaderSecond"></div>
        </div>

        <div id="overlayForDeletingNotes">
            <div class="text">Are you sure you want to delete this note?</div>
            <input type="button" value="Yes" id="deleteNote" class="btn clever-btn btn-2" />
            <input type="button" value="No" id="keepNote" class="btn clever-btn btn-2" />
        </div>

        <div id="overlayForDeletingEvents">
            <div class="text">Are you sure you want to delete this event?</div>
            <input type="button" value="Yes" id="deleteEvent" class="btn clever-btn btn-2" />
            <input type="button" value="No" id="keepEvent" class="btn clever-btn btn-2" />
        </div>
        
        <!-- ##### Footer Area End ##### -->

        <!-- ##### All Javascript Script ##### -->
        <!-- jQuery-2.2.4 js -->
        <script src="Stylesheet/js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="Stylesheet/js/bootstrap/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="Stylesheet/js/bootstrap/bootstrap.min.js"></script>
        <!-- All Plugins js -->
        <script src="Stylesheet/js/plugins/plugins.js"></script>
        <!-- Active js -->
        <script src="Stylesheet/js/active.js"></script>
        <!-- JavaScript for word features -->

        <!-- For Duration Picker -->
        <script src="html-duration-picker.min.js"></script>

        <!-- JavaScript for dynamic div -->
    </form>



</body>

<script>

    var allHeaders = [document.getElementById("headerForNotes1").innerHTML, document.getElementById("headerForNotes2").innerHTML, document.getElementById("headerForNotes3").innerHTML, document.getElementById("headerForNotes4").innerHTML, document.getElementById("headerForNotes5").innerHTML,
    document.getElementById("headerForNotes6").innerHTML, document.getElementById("headerForNotes7").innerHTML, document.getElementById("headerForNotes8").innerHTML, document.getElementById("headerForNotes9").innerHTML, document.getElementById("headerForNotes10").innerHTML, document.getElementById("headerForNotes11").innerHTML];

    var allDesc = [document.getElementById("textArea1"), document.getElementById("textArea2"), document.getElementById("textArea3"), document.getElementById("textArea4"), document.getElementById("textArea5"),
    document.getElementById("textArea6"), document.getElementById("textArea7"), document.getElementById("textArea8"), document.getElementById("textArea9"), document.getElementById("textArea10"), document.getElementById("textArea11")]

    $(document).ready(function () {
        //var d = new Date();
        //var day = d.getDate();
        //var month = d.getMonth()+1;
        //$(".article-number").html(day + month);
        //alert(((''+day).length<2 ? '0' : '') + day + (('' + month).length < 2 ? '0' : '') + month);

        //var d = new Date();
        //var strDate = d.toString('yyyy/MM/dd');
        //var dayOfStrDate = strDate.substring(8, 10);
        //var monthOfStrDate = strDate.substring(4, 7);
        ////alert(dayOfStrDate + monthOfStrDate);
        //$(".date").html(dayOfStrDate);
        //$(".month").html(monthOfStrDate);
        //$(".date").html("2 hours 30 seconds");
        //$(".month").html(" hour 30 seconds");

        var newscript = document.createElement('script');
        var insidescript = document.createTextNode("tinymce.init({selector: 'textarea', content_css: '//www.tiny.cloud/css/codepen.min.css', plugins: 'print preview searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap emoticons', toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | a11ycheck ltr rtl | showcomments addcomment', image_title: true, automatic_uploads: true, file_picker_types: 'image', file_picker_callback: function (cb, value, meta) {var input = document.createElement('input'); input.setAttribute('type', 'file'); input.setAttribute('accept', 'image/*'); input.onchange = function () { var file = this.files[0]; var reader = new FileReader(); reader.onload = function () { var id = 'blobid' + (new Date()).getTime(); var blobCache = tinymce.activeEditor.editorUpload.blobCache; var base64 = reader.result.split(',')[1]; var blobInfo = blobCache.create(id, file, base64); blobCache.add(blobInfo); cb(blobInfo.blobUri(), { title: file.name }); }; reader.readAsDataURL(file); }; input.click();}});");
        newscript.appendChild(insidescript);
        $("textarea").append(newscript);

        //if(IsPostBack)
        //{
        //    $.getJSON
        //}

        $('input:file').change(function () {
            if($(this).val())
            {
                $('#show').attr("disabled", false);
            }
            else
            {
                $('#show').attr("disabled", true);
            }
        });

    });

    //const parsed = file => JSON.parse(file);
    //const fr = new FileReader();
    var varForLoader;
    var testCounter = 1;
    var testCounterForEventSet = 1;
    var testingCounter = 1;
    var testingCounterSecond = 2;
    document.getElementById('show').addEventListener('click', function () {
        //alert('Success');
        
        document.getElementById("overlayForJSON").style.display = "block";
        varForLoader = setTimeout(loaderOffForJSON, 5000);

        $("#rowForNotes").empty();
        $("#containerBox").empty();
        tinymce.remove();
        var file = document.getElementById('myFile').files[0];
        var reader = new FileReader();
        reader.readAsText(file, 'UTF-8');
        reader.onload = function (evt) {

            // NEW CODES START
            var details = JSON.parse(evt.target.result);

            for (i = 0; i < details.thingsInAllNotes.length; i++) {
                var cards = details.thingsInAllNotes[i];
                
                //if (key == "header") {
                //    cardsHeader = cards[key].toString();
                //}
                //else
                //{
                //    cardsDescription = cards[key].toString();
                //}

                $("#rowForNotes").append("<div class='col-12 col-md-12 col-lg-6' style='width: 470px' id='bigDiv" + testCounter + "' ><div class='single-popular-course mb-100 wow fadeInUp' data-wow-delay='100ms' style='width: 470px'><div class='course-content' style='width: 470px' id='divForNC" + testCounter + "'><h4 id='headerForNotes" + testCounter + "' class='headersNotes' data-placeholder='Title...' contenteditable='true'></h4><input title='Use this button to change the color of the note' type='color' value='#ffffff' name='colorPicker' id='color" + testCounter + "' /><button title='Use this button to delete this note' type='button' name='goRemoveNotes' id='removeBtn" + testCounter + "' style='float:right; width:50px'><i class='fa fa-trash' style='font-size: 18px'></i></button><hr><textarea class='taclass' contenteditable='true' style='width: 420px; height: 300px' name='goTextArea' id='textArea" + testCounter + "'></textarea></div></div></div>");
                document.getElementById('headerForNotes' + testCounter).innerHTML = details.thingsInAllNotes[i].header;
                //tinyMCE.get('textArea' + testCounter).setContent(details.thingsInAllNotes[i].description);
                document.getElementById('textArea' + testCounter).innerHTML = details.thingsInAllNotes[i].description;
                document.getElementById('color' + testCounter).value = details.thingsInAllNotes[i].background;
                document.getElementById('divForNC' + testCounter).style.backgroundColor = details.thingsInAllNotes[i].background;
                testCounter++;
                
                var scriptForRTB2 = document.createElement('script');
                var textInsideScript2 = document.createTextNode("tinymce.init({selector: 'textarea', content_css: '//www.tiny.cloud/css/codepen.min.css', plugins: 'print preview searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap emoticons', toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | a11ycheck ltr rtl | showcomments addcomment', image_title: true, automatic_uploads: true, file_picker_types: 'image', file_picker_callback: function (cb, value, meta) {var input = document.createElement('input'); input.setAttribute('type', 'file'); input.setAttribute('accept', 'image/*'); input.onchange = function () { var file = this.files[0]; var reader = new FileReader(); reader.onload = function () { var id = 'blobid' + (new Date()).getTime(); var blobCache = tinymce.activeEditor.editorUpload.blobCache; var base64 = reader.result.split(',')[1]; var blobInfo = blobCache.create(id, file, base64); blobCache.add(blobInfo); cb(blobInfo.blobUri(), { title: file.name }); }; reader.readAsDataURL(file); }; input.click();}});");
                scriptForRTB2.appendChild(textInsideScript2);
                $(".taclass").append(scriptForRTB2);

                //for (var i = 0; i < cards.length; i++) {
                //    $("#rowForNotes").append("<div class='col-12 col-md-12 col-lg-6' style='width: 470px' id='bigDiv" + testCounter + "' ><div class='single-popular-course mb-100 wow fadeInUp' data-wow-delay='100ms' style='width: 470px'><div class='course-content' style='width: 470px' id='divForNC" + testCounter + "'><h4 id='headerForNotes" + testCounter + "' class='headersNotes' data-placeholder='Title...' contenteditable='true'></h4><input title='Use this button to change the color of the note' type='color' name='colorPicker' id='color" + testCounter + "' /><button title='Use this button to delete this note' type='button' name='goRemoveNotes' id='removeBtn" + testCounter + "' style='float:right; width:50px'><i class='fa fa-trash' style='font-size: 18px'></i></button><hr><textarea class='taclass' contenteditable='true' style='width: 420px; height: 300px' name='goTextArea' id='textArea" + testCounter + "'></textarea></div></div></div>");
                //    document.getElementById('headerForNotes' + testCounter).innerHTML = "Testing" + testCounter;
                //    testCounter++;
                //}

                //for (var key in cards) {
                //    //cardsName = key;
                //    //cardsDescription = cards[key].toString();
                //    //console.log(cardsDescription)
                //    //console.log(key);
                //    //$("#rowForNotes").append("<div class='col-12 col-md-12 col-lg-6' style='width: 470px' id='bigDiv" + testCounter + "' ><div class='single-popular-course mb-100 wow fadeInUp' data-wow-delay='100ms' style='width: 470px'><div class='course-content' style='width: 470px' id='divForNC" + testCounter + "'><h4 id='headerForNotes" + testCounter + "' class='headersNotes' data-placeholder='Title...' contenteditable='true'>" + key["header"] + "</h4><input title='Use this button to change the color of the note' type='color' name='colorPicker' id='color" + testCounter + "' /><button title='Use this button to delete this note' type='button' name='goRemoveNotes' id='removeBtn" + testCounter + "' style='float:right; width:50px'><i class='fa fa-trash' style='font-size: 18px'></i></button><hr><textarea class='taclass' contenteditable='true' style='width: 420px; height: 300px' name='goTextArea' id='textArea" + testCounter + "'>" + key["description"] + "</textarea></div></div></div>");
                //    //testCounter++;

                //    //if (key == "header") {
                //    //    cardsHeader = cards[key].toString();
                //    //}
                //    //else
                //    //{
                //    //    cardsDescription = cards[key].toString();
                //    //}
                //    //" + cardsHeader + "
                //    //" + cardsDescription + "
                //    $("#rowForNotes").append("<div class='col-12 col-md-12 col-lg-6' style='width: 470px' id='bigDiv" + testCounter + "' ><div class='single-popular-course mb-100 wow fadeInUp' data-wow-delay='100ms' style='width: 470px'><div class='course-content' style='width: 470px' id='divForNC" + testCounter + "'><h4 id='headerForNotes" + testCounter + "' class='headersNotes' data-placeholder='Title...' contenteditable='true'></h4><input title='Use this button to change the color of the note' type='color' name='colorPicker' id='color" + testCounter + "' /><button title='Use this button to delete this note' type='button' name='goRemoveNotes' id='removeBtn" + testCounter + "' style='float:right; width:50px'><i class='fa fa-trash' style='font-size: 18px'></i></button><hr><textarea class='taclass' contenteditable='true' style='width: 420px; height: 300px' name='goTextArea' id='textArea" + testCounter + "'></textarea></div></div></div>");
                //    document.getElementById('headerForNotes' + testCounter).innerHTML = "Testing" + testCounter;
                //    testCounter++;
                    
                //}

            }
            var halfOfTheLength = details.detailsInEvent.length / 2;
            for (var i = 0; i < details.detailsInEvent.length;) {
                $("#containerBox").append("<div class='timeline-article' id='eventSet" + testCounterForEventSet + "'><div class='content-left-container'><div class='content-left' id='divForCPE" + testingCounter + "'><h4 contenteditable='true' id='uniqueheaderForEvent" + testingCounter + "' class='headerForEvent' data-placeholder='Title...'></h4><textarea id='textAreaSet" + testingCounter + "' name='textAreasForEvents' style='height: 400px' class='taclass' contenteditable='true'></textarea><input title='Use this button to change the color of the note' type='color' value='#ffffff' name='colorPickerForEvent' id='colorForEvent" + testingCounter + "' /></div><label>Duration:</label><br /><input type='number' min='0' max='23' name='goDuration' style='width: 50px' id='addDurationInput" + testCounterForEventSet + "' />&nbsp<label>hour(s)</label>&nbsp<input type='number' min='0' max='59' name='goMinutes' style='width: 50px' id='addMinutesInput" + testCounterForEventSet + "' />&nbsp<label>minute(s)</label><br /><label>Start Time:</label><br /><input name='goTime' type='time' id='inputForStartTime" + testCounterForEventSet + "' /></div><div class='content-right-container'><div class='content-right' id='divForCPE" + testingCounterSecond + "'><h4 contenteditable='true' id='uniqueheaderForEvent" + testingCounterSecond + "' class='headerForEvent' data-placeholder='Title...'></h4><textarea id='textAreaSet" + testingCounterSecond + "' name='textAreasForEvents' style='height: 400px' class='taclass' contenteditable='true'></textarea><input title='Use this button to change the color of the note' type='color' value='#ffffff' name='colorPickerForEvent' id='colorForEvent" + testingCounterSecond + "'/></div></div><div class='meta-date'><span class='date' id='circleForEvent" + testCounterForEventSet + "'></span></div><button title='Use this button to delete this event' type='button' name='goRemoveEvents' id='removeEventBtn" + testCounterForEventSet + "' class='btn clever-btn btn-2' style='display: block; margin-left: auto; margin-right: auto; margin-bottom: 50px; margin-top: 300px'><i class='fa fa-trash' style='font-size: 18px'></i></button><input type='button' value='+' class='btn clever-btn btn-2' name='goButton' title='Use this button to add an event' style='display: block; margin-left: auto; margin-right: auto; background: #00b0bd; color: rgba(0, 0, 0, 0.50); font-size:xx-large; margin-top: 300px' id='addEventBtn" + testCounterForEventSet + "' /></div>");

                document.getElementById('uniqueheaderForEvent' + testingCounter).innerHTML = details.detailsInEvent[i].title;
                document.getElementById('textAreaSet' + testingCounter).innerHTML = details.detailsInEvent[i].detail;
                document.getElementById('colorForEvent' + testingCounter).value = details.detailsInEvent[i].divColor;
                document.getElementById('divForCPE' + testingCounter).style.backgroundColor = details.detailsInEvent[i].divColor;
                //document.getElementById('addDurationInput' + testCounterForEventSet).value = details.detailsInEvent[i].hours;
                //document.getElementById('addMinutesInput' + testCounterForEventSet).value = details.detailsInEvent[i].minutes;
                //document.getElementById('inputForStartTime' + testCounterForEventSet).value = details.detailsInEvent[i].start;

                
                i++;

                document.getElementById('uniqueheaderForEvent' + testingCounterSecond).innerHTML = details.detailsInEvent[i].title;
                document.getElementById('textAreaSet' + testingCounterSecond).innerHTML = details.detailsInEvent[i].detail;
                document.getElementById('colorForEvent' + testingCounterSecond).value = details.detailsInEvent[i].divColor;
                document.getElementById('divForCPE' + testingCounterSecond).style.backgroundColor = details.detailsInEvent[i].divColor;
                i++;
                testCounterForEventSet++;
                testingCounter += 2;
                testingCounterSecond += 2;

                var newscript2 = document.createElement('script');
                var insidescript2 = document.createTextNode("tinymce.init({selector: 'textarea', content_css: '//www.tiny.cloud/css/codepen.min.css', plugins: 'print preview searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap emoticons', toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl | showcomments addcomment', image_title: true, automatic_uploads: true, file_picker_types: 'image', file_picker_callback: function (cb, value, meta) {var input = document.createElement('input'); input.setAttribute('type', 'file'); input.setAttribute('accept', 'image/*'); input.onchange = function () { var file = this.files[0]; var reader = new FileReader(); reader.onload = function () { var id = 'blobid' + (new Date()).getTime(); var blobCache = tinymce.activeEditor.editorUpload.blobCache; var base64 = reader.result.split(',')[1]; var blobInfo = blobCache.create(id, file, base64); blobCache.add(blobInfo); cb(blobInfo.blobUri(), { title: file.name }); }; reader.readAsDataURL(file); }; input.click();}});");
                newscript2.appendChild(insidescript2);
                $(".taclass").append(newscript2);
            }

            var indexTest = 1;
            for (var i = 0; i < details.timeInputs.length; i++) {
                
                document.getElementById('addDurationInput' + indexTest).value = details.timeInputs[i].hour;
                document.getElementById('addMinutesInput' + indexTest).value = details.timeInputs[i].minute;
                document.getElementById('inputForStartTime' + indexTest).value = details.timeInputs[i].start;
                indexTest++;
            }

            var circleIndex = 1;
            for (var i = 0; i < details.circleTime.length; i++) {

                document.getElementById('circleForEvent' + circleIndex).innerHTML = details.circleTime[i].totalTime;
                circleIndex++;
            }

            //for (var i = 0; i < allHeaders.length; i++) {
            //    console.log(allHeaders[i]);
            //}

            //document.getElementById('content').innerHTML = evt.target.result;

            $('#removeEventBtn1').attr("disabled", true);
            document.getElementById('removeEventBtn1').style.cursor = "not-allowed";
        }
        
        //JSONParser parser = new JSONParser();

        

        //let json = JSON.stringify(file);
        //const blob = new Blob([json], { type: "application/json" });
        //const fr = new FileReader();
        //fr.addEventListener("load", e => {
        //    console.log(e.target.result, JSON.parse(fr.result));
        //});
        //fr.readAsText(blob);

        //$.getJSON(file, function (data) {
        //    console.log(data);
        //});
    })

    //$('#viewjsonfilebtn').click(function () {
    //    var ful1 = document.getElementById("File1");
    //    alert(ful1.value);
    //    //var nameOfFile = ful1.value.substring(12, ful1.value.length);
    //    ////alert(nameOfFile);
    //    //$.getJSON(ful1.value, function (result) {
    //    //    console.log(result);
    //    //});
    //});

    function getDynamicElement() {

        return '<div class="col-12 col-md-6 col-lg-4" style="width: 350px"><div class="single-popular-course mb-100 wow fadeInUp" data-wow-delay="750ms" style="width: 350px"><div class="course-content" style="width: 350px"><h4 class="headerDiv" contenteditable="true"></h4><textarea contenteditable="true" data-placeholder="Your notes" style="width: 300px; height: 300px"></textarea>' + addScript(this) + '</div></div></div>';
    }

    function addDiv() {
        var div = document.createElement('DIV');
        div.innerHTML = getDynamicElement();
        //div.classList.add("col-12 col-md-6 col-lg-4");
        document.getElementById("divForNewCards").appendChild(div);
        return false;
    }

    function handle_form_submission() {
        alert('Submit button pressed');
        return false; //do not submit the form
    }

    function addScript() {
        var newScript = document.createElement("script");
        var inlineScript = document.createTextNode("tinymce.init({selector: 'textarea', plugins:  'autolink lists media table tinycomments', toolbar: 'addcomment showcomments code table', toolbar_mode: 'floating', tinycomments_mode: 'embedded', tinycomments_author: 'Author name',});");
        newScript.appendChild(inlineScript);
        document.getElementById("divForNC").appendChild(newScript);
    }

    //var quill = new Quill('#editor', {
    //    theme: 'snow'
    //});

    //function showNewNotes() {
    //    document.getElementById("loaderForNewNotes").style.display = "none";
    //}

    var myVar;
    var counterColor = 12;
    $('#divForAddNoteBtn').on('click', '#addNoteBtn', function () {
        //document.getElementById("loaderForNewNotes").style.display = "block";
        //jQuery("#loaderForNewNotes").show();
        //var bringLoaderOut = setTimeout(showNewNotes, 3000);

        //jQuery(".loader").show();
        //jQuery("#creatingNoteLabel").show();
        //jQuery("#addNoteBtn").hide();
        //myVar = setTimeout(showPage, 4000);

        document.getElementById("overlayForNotes").style.display = "block";
        myVar = setTimeout(showPage, 4000);

        //alert("Hi");
        tinymce.remove();
        //$("<div class='col-12 col-md-6 col-lg-4' style='width: 470px'><div class='single-popular-course mb-100 wow fadeInUp' data-wow-delay='750ms' style='width: 470px'><div class='course-content' style='width: 470px'><h4 contenteditable='true'></h4><input title='Use this button to change the color of the note' type='color' id='color" + counterColor + "' /><hr><textarea class='taclass' contenteditable='true' style='width: 420px; height: 300px'></textarea></div></div></div>").append("#rowForNotes");
        $("#rowForNotes").append("<div class='col-12 col-md-12 col-lg-6' style='width: 470px' id='bigDiv" + counterColor + "' ><div class='single-popular-course mb-100 wow fadeInUp' data-wow-delay='100ms' style='width: 470px'><div class='course-content' style='width: 470px' id='divForNC" + counterColor + "'><h4 id='headerForNotes" + counterColor + "' class='headersNotes' data-placeholder='Title...' contenteditable='true'></h4><input title='Use this button to change the color of the note' type='color' value='#ffffff' name='colorPicker' id='color" + counterColor + "' /><button title='Use this button to delete this note' type='button' name='goRemoveNotes' id='removeBtn" + counterColor + "' style='float:right; width:50px'><i class='fa fa-trash' style='font-size: 18px'></i></button><hr><textarea class='taclass' contenteditable='true' style='width: 420px; height: 300px' name='goTextArea' id='textArea" + counterColor + "'></textarea></div></div></div>");
        var scriptForRTB = document.createElement('script');
        var textInsideScript = document.createTextNode("tinymce.init({selector: 'textarea', content_css: '//www.tiny.cloud/css/codepen.min.css', plugins: 'print preview searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap emoticons', toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl | showcomments addcomment', image_title: true, automatic_uploads: true, file_picker_types: 'image', file_picker_callback: function (cb, value, meta) {var input = document.createElement('input'); input.setAttribute('type', 'file'); input.setAttribute('accept', 'image/*'); input.onchange = function () { var file = this.files[0]; var reader = new FileReader(); reader.onload = function () { var id = 'blobid' + (new Date()).getTime(); var blobCache = tinymce.activeEditor.editorUpload.blobCache; var base64 = reader.result.split(',')[1]; var blobInfo = blobCache.create(id, file, base64); blobCache.add(blobInfo); cb(blobInfo.blobUri(), { title: file.name }); }; reader.readAsDataURL(file); }; input.click();}});");
        scriptForRTB.appendChild(textInsideScript);
        $(".taclass").append(scriptForRTB);
        counterColor++;
        //jQuery("#loaderForNewNotes").hide();
    });

    $('#rowForNotes').on('change', 'input[name$="colorPicker"]', function () {

        var specificIdOfColorPicker = event.target.id;
        console.log(specificIdOfColorPicker);
        var noFromSpecificIdOfColorPicker = specificIdOfColorPicker.substring(5, specificIdOfColorPicker.length);
        console.log(noFromSpecificIdOfColorPicker);
        //alert(noFromSpecificIdOfColorPicker);
        var textForDiv = "divForNC" + noFromSpecificIdOfColorPicker;
        document.getElementById(textForDiv).style.backgroundColor = event.target.value;
    });

    $('#rowForNotes').on('click', 'button[name$="goRemoveNotes"]', function () {
        var idOfClickedRemoveBtn = this.id;
        var noFromIdOfClickedRemoveBtn = idOfClickedRemoveBtn.substring(9, idOfClickedRemoveBtn.length);
        //alert(noFromIdOfClickedRemoveBtn);
        var divToDelete = "bigDiv" + noFromIdOfClickedRemoveBtn;
        console.log(divToDelete);
        var noteToRemove = document.getElementById(divToDelete);
        //document.getElementById("overlayForDeletingNotes").style.display = "block";

        var rmv = confirm("Are you sure you want to delete this note?");
        if (rmv==true) {
            noteToRemove.remove();
            console.log("Removed successfully: " + noteToRemove);
        }
        else
        {
            console.log("Failed to remove");
        }

        //$('#overlayForDeletingNotes').on('click', '#deleteNote', function () {
        //    noteToRemove.remove();
        //    document.getElementById("overlayForDeletingNotes").style.display = "none";
        //});
        //$('#overlayForDeletingNotes').on('click', '#keepNote', function () {
        //    document.getElementById("overlayForDeletingNotes").style.display = "none";
        //});
        ////var noteToDelete = document.getElementById('divForNC' + noFromIdOfClickedRemoveBtn);
        //var elem = "divForNC" + noFromIdOfClickedRemoveBtn;
        ////alert(elem);


        ////check if they really want to delete
        //document.getElementById("overlayForDeletingNotes").style.display = "block";

        //$('#overlayForDeletingNotes').on('click', '#deleteNote', function () {
        //    alert(elem);
        //    //alert("Success");
        //    //removeDiv(elem);
        //    document.getElementById("overlayForDeletingNotes").style.display = "none";
        //    //var notetoRemove = document.getElementById(elem);
        //    //notetoRemove.parentElement.removeChild(notetoRemove);

        //    //notetoRemove
        //});

        ////$('#overlayForDeletingNotes').on('click', '#deleteNote', function () {
        ////    //alert("Yes Button is clicked");
        ////    //jQuery("#overlayForDeletingNotes").hide();
        ////    //noteToDelete.remove();

        ////    //var i = noFromIdOfClickedRemoveBtn - 1;
        ////    //var wholeDiv = document.getElementById("rowForNotes");
        ////    //wholeDiv.removeChild(wholeDiv.childNodes[noFromIdOfClickedRemoveBtn]);
        ////    //$("#divForNC" + noFromIdOfClickedRemoveBtn).remove();
        ////    //alert(noteToDelete.id);
        ////    //$('#rowForNotes').remove();

        ////    //noteToDelete.parentNode.removeChild(noteToDelete);

        ////    document.getElementById("overlayForDeletingNotes").style.display = "none";

        ////});

        ////$('#overlayForDeletingNotes').on('click', '#keepNote', function () {
        ////    //alert("No Button is clicked");
        ////    document.getElementById("overlayForDeletingNotes").style.display = "none";
        ////});

        ////idOfClickedRemoveBtn = "";

        ////noteToDelete = "";
        ////noteToDelete.remove();

    });

    //function removeDiv(elem) {
    //    elem.parentNode.removeChild(elem);
    //}

    function showPage() {
        ////var testingId = event.target.id;
        ////alert(testingId);
        //jQuery(".loader").hide();
        //jQuery("#creatingNoteLabel").hide();
        ////jquery("#addNoteBtn").show();
        //document.getElementById("addNoteBtn").style.display = "inline-block";
        document.getElementById("overlayForNotes").style.display = "none";
    }

    var secondMyVar;
    var counter = 2;
    var counterColorForEvent = 3;
    var secondCounterColorForEvent = 4;
    $('#containerBox').on('click', 'input[name$="goButton"]', function () {

        document.getElementById("overlay").style.display = "block";
        secondMyVar = setTimeout(off, 4000);

        //jQuery(".secondLoader").show();
        //jQuery("#creatingEventLabel").show();
        //jQuery(this).hide();
        //jQuery(".buttonload").show();
        //secondMyVar = setTimeout(showSecondPage, 5000);
        //secondMyVar = setTimeout(showSecondPage, 3000);
        //<input type="button" value="Add New Event" class="btn clever-btn btn-2" id="addEventBtn1" name="goButton" style="display: block; margin-left: auto; margin-right: auto; background: #00b0bd; color: rgba(0, 0, 0, 0.50);" />
        //$(this).replaceWith("<button class='buttonload' style><i class='fa fa-spinner fa-spin'>Loading</button>")

        //retrieves the element that is being clicked
        //var buttonItem = document.getElementById(event.target.id);

        //alert($('input[name$="goButton"]').index(buttonItem));

        //gives the position of the element, 0, 1, 2 etc
        //var positionOfButton = $('input[name$="goButton"]').index(buttonItem) + 1;
        //alert("Button number " + positionOfButton);

        //console.log($('input[name$="goButton"]').get(0));

        tinymce.remove();
        //var selectedBtn = $('input[name$="goButton"]').index('input[name$="goButton"]'), curIndex = $(this).index('input[name$="goButton"]');


        var specificId = event.target.id;
        var noFromSpecificId = specificId.substring(11, specificId.length);
        var text = $('#spanForAN' + noFromSpecificId).html();
        noFromSpecificId++;
        //If want to give index 1 2 3 for the events
        //$("<div class='timeline-article'><div class='content-left-container'><div class='content-left'><p class='testclass' data-placeholder='Your Notes' contenteditable><textarea contenteditable='true'></textarea><span contenteditable='false' class='article-number'>1</span></p></div></div><div class='content-right-container'><div class='content-right'><p class='testclass' contenteditable data-placeholder='Your Notes'><textarea contenteditable='true'></textarea><span contenteditable='false' class='article-number'>2</span></p></div></div><div class='meta-date'><span class='date' id='spanForAN" + text + "'>" + text + "</span></div></div><input type='button' value='Add New Event' class='btn clever-btn btn-2' name='goButton' style='display: block; margin-left: auto; margin-right: auto; background: #00b0bd; color: rgba(0, 0, 0, 0.50);' id='addEventBtn" + text + "' />").insertAfter(this);

        //If want to put date there

        //var indexToAddAfter = counter - 1;
        var idOfTheEventToDelete = this.id;
        var noFromIdOfTheEventToDelete = idOfTheEventToDelete.substring(11, idOfTheEventToDelete.length);
        var whereToInsertAfter = document.getElementById("eventSet" + noFromIdOfTheEventToDelete);
        $("<div class='timeline-article' id='eventSet" + counter + "'><div class='content-left-container'><div class='content-left' style='background-color: #8080ff' id='divForCPE" + counterColorForEvent + "'><h4 class='headerForEvent' contenteditable='true' id='uniqueheaderForEvent" + counterColorForEvent + "' data-placeholder='Title...'></h4><textarea id='textAreaSet" + counterColorForEvent + "' name='textAreasForEvents' style='height: 400px' class='taclass' contenteditable='true'></textarea><input title='Use this button to change the color of the note' type='color' value='#8080ff' name='colorPickerForEvent' id='colorForEvent" + counterColorForEvent + "' /></div><label>Duration:</label><br /><input type='number' min='0' max='23' name='goDuration' style='width: 50px' id='addDurationInput" + counter + "' />&nbsp<label>hour(s)</label>&nbsp<input type='number' min='0' max='59' name='goMinutes' style='width: 50px' id='addMinutesInput" + counter + "' />&nbsp<label>minute(s)</label><br /><label>Start Time:</label><br /><input name='goTime' type='time' id='inputForStartTime" + counter + "' /></div><div class='content-right-container'><div class='content-right' style='background-color: #80ff00' id='divForCPE" + secondCounterColorForEvent + "'><h4 contenteditable='true' id='uniqueheaderForEvent" + secondCounterColorForEvent + "' class='headerForEvent' data-placeholder='Title...'></h4><textarea id='textAreaSet" + secondCounterColorForEvent + "' name='textAreasForEvents' style='height: 400px' class='taclass' contenteditable='true'></textarea><input title='Use this button to change the color of the note' type='color' value='#80ff00' name='colorPickerForEvent' id='colorForEvent" + secondCounterColorForEvent + "'/></div></div><div class='meta-date'><span class='date' id='circleForEvent" + counter + "'></span></div><button title='Use this button to delete this event' type='button' name='goRemoveEvents' id='removeEventBtn" + counter + "' class='btn clever-btn btn-2' style='display: block; margin-left: auto; margin-right: auto; margin-bottom: 50px; margin-top: 300px'><i class='fa fa-trash' style='font-size: 18px'></i></button><input type='button' value='+' class='btn clever-btn btn-2' name='goButton' title='Use this button to add an event' style='display: block; margin-left: auto; margin-right: auto; background: #00b0bd; color: rgba(0, 0, 0, 0.50); font-size:xx-large; margin-top: 300px' id='addEventBtn" + counter + "' /></div>").insertAfter(whereToInsertAfter);

        //retrieves the element that is being clicked
        //var buttonItem = document.getElementById(event.target.id);

        //var indexOfBtn = $('input[name$="goButton"]').index(buttonItem) + 1;
        //buttonItem.setAttribute("id", "addEventBtn" + indexOfBtn);


        //alert($('input[name$="goButton"]').index(buttonItem));

        //gives the position of the element, 0, 1, 2 etc
        //var positionOfButton = $('input[name$="goButton"]').index(buttonItem) + 1;
        //alert("Button number " + positionOfButton);

        //$(".date").html("2 hours 30 seconds");

        //var d = new Date();
        //var strDate = d.toString('yyyy/MM/dd');
        //var dayOfStrDate = strDate.substring(8, 10);
        //var monthOfStrDate = strDate.substring(4, 7);
        ////alert(dayOfStrDate + monthOfStrDate);
        //$(".date").html(dayOfStrDate);
        //$(".month").html(monthOfStrDate);


        var newscript = document.createElement('script');
        var insidescript = document.createTextNode("tinymce.init({selector: 'textarea', content_css: '//www.tiny.cloud/css/codepen.min.css', plugins: 'print preview searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap emoticons', toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl | showcomments addcomment', image_title: true, automatic_uploads: true, file_picker_types: 'image', file_picker_callback: function (cb, value, meta) {var input = document.createElement('input'); input.setAttribute('type', 'file'); input.setAttribute('accept', 'image/*'); input.onchange = function () { var file = this.files[0]; var reader = new FileReader(); reader.onload = function () { var id = 'blobid' + (new Date()).getTime(); var blobCache = tinymce.activeEditor.editorUpload.blobCache; var base64 = reader.result.split(',')[1]; var blobInfo = blobCache.create(id, file, base64); blobCache.add(blobInfo); cb(blobInfo.blobUri(), { title: file.name }); }; reader.readAsDataURL(file); }; input.click();}});");
        newscript.appendChild(insidescript);
        $(".taclass").append(newscript);

        //$("<div class='timeline-article'><div class='content-left-container'><div class='content-left'><textarea contenteditable='true' data-placeholder='Your Notes'></textarea></div></div><div class='content-right-container'><div class='content-right'><textarea contenteditable='true' data-placeholder='Your Notes'></textarea></div></div></div></div><input type='button' value='Add New Event' class='btn clever-btn btn-2' name='goButton' style='display: block; margin-left: auto; margin-right: auto; background: #00b0bd; color: rgba(0, 0, 0, 0.50);' id='addEventBtn" + text + "' />").insertAfter(this);
        //<div class='meta-date'><span class='date' id='spanForAN" + text + "'>" + text + "</span>
        //var divForNo = document.createElement('div');
        //divForNo.classList.add('meta-date');
        //var spanForNo = document.createElement('span');
        //spanForNo.classList.add('date');

        //var testing = document.createElement('script');
        //var inlinescript = document.createTextNode("tinymce.init({selector: 'textarea', content_css: '//www.tiny.cloud/css/codepen.min.css', plugins: 'print preview importcss tinydrive searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap emoticons', toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl | showcomments addcomment', image_title: true, automatic_uploads: true, file_picker_types: 'image', file_picker_callback: function (cb, value, meta) {var input = document.createElement('input'); input.setAttribute('type', 'file'); input.setAttribute('accept', 'image/*'); input.onchange = function () { var file = this.files[0]; var reader = new FileReader(); reader.onload = function () { var id = 'blobid' + (new Date()).getTime(); var blobCache = tinymce.activeEditor.editorUpload.blobCache; var base64 = reader.result.split(',')[1]; var blobInfo = blobCache.create(id, file, base64); blobCache.add(blobInfo); cb(blobInfo.blobUri(), { title: file.name }); }; reader.readAsDataURL(file); }; input.click();}");
        //testing.appendChild(inlinescript);
        //document.getElementByClass("testClass").appendChild(testing);


        //check how many divs are created, then take the digit from the id of the button that was clicked (E.g. 1 from addEventBtn1), pass it to the span's id (E.g. spanForAN1), take out text of that span, 

        //test if spanForAN4's index is 2 (if created after 1), if yes then switch spanForAN4's text from 
        counter++;
        counterColorForEvent += 2;
        secondCounterColorForEvent += 2;;
        //var noOfTLDiv = $('.timeline-article').length;


        //alert(noOfTLDiv + " exists");
        //var indexOfspanForAN1 = $('.date').index('#spanForAN1');
        //alert(indexOfspanForAN1);

        //Take span id + test, then find the index of the div that is going to be created (first div created will actually be the second div in the timeline as one was already created by me and the index should be 1 as the already created one is index 0)
        //index + 1 is the number that should appear in the circle span
        //var testItem = document.getElementById("spanForAN" + 2);
        //var actual = $( "span" ).index( testItem ) - 241;
        //alert( "Index: " +  actual);



        //whenever create one event, take the id of 
        //var x = document.getElementsByClassName("date");
        //var i;
        //for (i = 0; i < x.length; i++)
        //{
        //    //$("spanForAN" + i)
        //    x[i].html(i+1);

        //}

        //var noOfSpan4 = $('#spanForAN4').length;
        //var spanItem4 = $( "#spanForAN4" );

        //if (noOfSpan4 > 0)
        //{
        //    alert( "Index: " + $( "span" ).index( spanItem4 ) );
        //}

    });

    $('#Section1').on('keyup', '#nameOfJSONFile', function () {
        if (this.value == "") {
            $('#saveToJSONBtn').attr("disabled", true);
        }
        else {
            $('#saveToJSONBtn').attr("disabled", false);
        }
    });

    //function checkIfGotValue() {
    //    //alert("hello");
    //    $('#nameOfJSONFile').onkeyup(function () {
    //        if ($(this).val() == '')
    //        {
    //            $('#saveToJSONBtn').attr('disabled', true);
    //        }
    //        else
    //        {
    //            $('#saveToJSONBtn').attr('disable', false);
    //        }
    //    });
    //}

    $('#containerBox').on('click', 'button[name$="goRemoveEvents"]', function () {
        console.log("START")
        var idOfClickedRemoveEventBtn = this.id;
        var noFromIdOfClickedRemoveEventBtn = idOfClickedRemoveEventBtn.substring(14, idOfClickedRemoveEventBtn.length);
        //console.log(noFromIdOfClickedRemoveEventBtn);
        var eventSetToDelete = "eventSet" + noFromIdOfClickedRemoveEventBtn;
        console.log("EVENT SET TO DELETE: " + eventSetToDelete)
        var setOfEventToRemove = document.getElementById(eventSetToDelete);
        console.log("SET OF EVENT TO REMOVE: " + setOfEventToRemove)
        //document.getElementById("overlayForDeletingEvents").style.display = "block";
        //var indexOfEvent = noFromIdOfClickedRemoveEventBtn - 1;
        //console.log("INDEX OF EVENT: " + indexOfEvent)

        //var testingIndex = $('button[name$="goRemoveEvents"]').index(setOfEventToRemove);
        //console.log("TESTING INDEX: " + testingIndex)
        //var indexToTest = testingIndex - 1;
        //console.log("INDEX TO TEST: " + indexToTest)
        //var elementToRemove = $('.timeline-article').eq(testingIndex);
        //console.log("ELEMENT TO REMOVE: " + elementToRemove)

        //console.log(elementToRemove.isEqualNode(setOfEventToRemove));
        //if ($('button[name$="goRemoveEvents"]').index(setOfEventToRemove) == indexOfEvent)
        //{

        var del = confirm("Are you sure you want to delete this event?");
        if (del==true) {
            var eventSetToDelete = "eventSet" + noFromIdOfClickedRemoveEventBtn;
            console.log("EVENT SET TO DELETE: " + eventSetToDelete)
            var setOfEventToRemove = document.getElementById(eventSetToDelete);
            console.log("SET OF EVENT TO REMOVE: " + setOfEventToRemove)

            setOfEventToRemove.remove();
            console.log("REMOVED SUCCESS: " + setOfEventToRemove)
        }
        else
        {
            console.log("EVENT SET TO DELETE: " + eventSetToDelete)
            console.log("SET OF EVENT TO REMOVE: " + setOfEventToRemove)
            console.log("FAILED TO REMOVE")
        }

        //$('#overlayForDeletingEvents').on('click', '#deleteEvent', function deleteEvent() {
        //    //var outsideDiv = document.getElementById("containerBox");
        //    //var indexOfEvent = noFromIdOfClickedRemoveEventBtn - 1;
        //    //outsideDiv.removeChild(outsideDiv.replaceChild);

        //    //var divToReplace = document.createElement('div');
        //    //setOfEventToRemove.replaceChild(divToReplace, setOfEventToRemove);

        //    //setOfEventToRemove.removeChild(setOfEventToRemove.childNodes);
        //    var eventSetToDelete = "eventSet" + noFromIdOfClickedRemoveEventBtn;
        //    console.log("EVENT SET TO DELETE: " + eventSetToDelete)
        //    var setOfEventToRemove = document.getElementById(eventSetToDelete);
        //    console.log("SET OF EVENT TO REMOVE: " + setOfEventToRemove)

        //    setOfEventToRemove.remove();
        //    console.log("REMOVED SUCCESS: " + setOfEventToRemove)

        //    //elementToRemove.remove();
        //    document.getElementById("overlayForDeletingEvents").style.display = "none";

        //    //var numberOfDivs = $('button[name$="goRemoveEvents"]').length;
        //    //if (numberOfDivs > 2)
        //    //{
        //    //    var testingIndex = $('button[name$="goRemoveEvents"]').index(setOfEventToRemove);
        //    //    var indexToTest = testingIndex - 1;
        //    //    var elementToRemove = $('.timeline-article').eq(indexToTest);
        //    //    elementToRemove.remove();
        //    //    document.getElementById("overlayForDeletingEvents").style.display = "none";
        //    //}
        //    //else
        //    //{
        //    //    var testingIndex2 = $('button[name$="goRemoveEvents"]').index(setOfEventToRemove);
        //    //    var indexToTest2 = testingIndex2 - 1;
        //    //    var elementToRemove2 = $('.timeline-article').eq(indexToTest2);
        //    //    elementToRemove2.remove();
        //    //    document.getElementById("overlayForDeletingEvents").style.display = "none";
        //    //}

        //    //noFromIdOfClickedRemoveEventBtn = undefined;
        //});
        //$('#overlayForDeletingEvents').on('click', '#keepEvent', function keepEvent() {
        //    document.getElementById("overlayForDeletingEvents").style.display = "none";
            
        //    //eventSetToDelete = "";
        //    //console.log("EVENT SET TO DELETE: " + eventSetToDelete)
        //    //setOfEventToRemove = "";
        //    //console.log("SET OF EVENT TO REMOVE: " + setOfEventToRemove)
            
        //    console.log("FAILED TO REMOVE")
        //});

        //indexToTest = 0;
        //}
        //else
        //{
        //    console.log("Fail");
        //}
        //elementToRemove = "";
        //noFromIdOfClickedRemoveEventBtn = "";
        //delete noFromIdOfClickedRemoveEventBtn

        //async function clearingVar() {
        //    noFromIdOfClickedRemoveEventBtn = await 
        //}
    });

    function off() {
        document.getElementById("overlay").style.display = "none";
    }

    $('#containerBox').on('change', 'input[name$="colorPickerForEvent"]', function () {
        var specificIdOfCPE = event.target.id;
        console.log(specificIdOfCPE);
        var noFromSpecificIdOfCPE = specificIdOfCPE.substring(13, specificIdOfCPE.length);
        console.log(noFromSpecificIdOfCPE);
        //alert(noFromSpecificIdOfCPE);
        var colorForDiv = "divForCPE" + noFromSpecificIdOfCPE;
        document.getElementById(colorForDiv).style.backgroundColor = event.target.value;
    });

    function checkIndexOfDurationInput() {
        var durationItem = $('input[name$="goDuration"]').length;
        var i = 0;
        do {
            var durationInputThatBelongsThere = $('input[name$="goDuration"]').eq(i);
            var circleSpanThatBelongsThere = $('.date').eq(i)
            i++;
            durationInputThatBelongsThere.attr("id", "addDurationInput" + i);
            circleSpanThatBelongsThere.attr("id", "circleForEvent" + i);
        } while (i < durationItem);

        var minutesItem = $('input[name$="goMinutes"]').length;
        var j = 0;
        do {
            var minutesInputThatBelongsThere = $('input[name$="goMinutes"]').eq(j);
            j++;
            minutesInputThatBelongsThere.attr("id", "addMinutesInput" + j);
        } while (j < minutesItem);

        var startTimeItem = $('input[name$="goTime"]').length;
        var b = 0;
        do {
            var startTimeInputThatBelongsThere = $('input[name$="goTime"]').eq(b);
            b++;
            startTimeInputThatBelongsThere.attr("id", "inputForStartTime" + b);
        } while (b < startTimeItem);

        var addEventBtnItem = $('input[name$="goButton"]').length;
        var x = 0;
        do {
            var eventBtnThatBelongsThere = $('input[name$="goButton"]').eq(x);
            x++;
            eventBtnThatBelongsThere.attr("id", "addEventBtn" + x);
        } while (x < addEventBtnItem);

        var removeEventBtnItem = $('button[name$="goRemoveEvents"]').length;
        var y = 0;
        do {
            var deleteBtnThatBelongsThere = $('button[name$="goRemoveEvents"]').eq(y);
            y++;
            deleteBtnThatBelongsThere.attr("id", "removeEventBtn" + y);
        } while (y < removeEventBtnItem);

        var noOfTimeLine = $('.timeline-article').length;
        var z = 0;
        do {
            var eventThatBelongsThere = $('.timeline-article').eq(z);
            z++;
            eventThatBelongsThere.attr("id", "eventSet" + z);
        } while (z < noOfTimeLine);

        var removeNotesBtnItems = $('button[name$="goRemoveNotes"]').length;
        var indexForRemoveNotesBtn = 0;
        do {
            var deleteNoteBtnThatBelongsThere = $('button[name$="goRemoveNotes"]').eq(indexForRemoveNotesBtn);
            indexForRemoveNotesBtn++;
            deleteNoteBtnThatBelongsThere.attr("id", "removeBtn" + indexForRemoveNotesBtn);
        } while (indexForRemoveNotesBtn < removeNotesBtnItems);

        var noOfBigDiv = $('.col-md-12').length;
        var indexForBigDiv = 0;
        do {
            var notesBigDivThatBelongsThere = $('.col-md-12').eq(indexForBigDiv);
            indexForBigDiv++;
            notesBigDivThatBelongsThere.attr("id", "bigDiv" + indexForBigDiv);
        } while (indexForBigDiv < noOfBigDiv);

        var noOfDivForNC = $('.course-content').length;
        var indexForDivForNC = 0;
        do {
            var notesDivForNCThatBelongsThere = $('.course-content').eq(indexForDivForNC);
            var colorPickerThere = $('input[name$="colorPicker"]').eq(indexForDivForNC);
            indexForDivForNC++;
            notesDivForNCThatBelongsThere.attr("id", "divForNC" + indexForDivForNC);
            colorPickerThere.attr("id", "color" + indexForDivForNC);
        } while (indexForDivForNC < noOfDivForNC);

        var noOfTextAreaForNotes = $('textarea[name$="goTextArea"]').length;
        var indexForTextAreaForNotes = 0;
        do {
            var textAreaForNotesThatBelongsThere = $('textarea[name$="goTextArea"]').eq(indexForTextAreaForNotes);
            indexForTextAreaForNotes++;
            textAreaForNotesThatBelongsThere.attr("id", "textArea" + indexForTextAreaForNotes);
        } while (indexForTextAreaForNotes < noOfTextAreaForNotes);

        var noOfHeadersForNotes = $('.headersNotes').length;
        var indexForHeaderForNotes = 0;
        do {
            var headersForNotesThatBelongsThere = $('.headersNotes').eq(indexForHeaderForNotes);
            indexForHeaderForNotes++;
            headersForNotesThatBelongsThere.attr("id", "headerForNotes" + indexForHeaderForNotes);
        } while (indexForHeaderForNotes < noOfHeadersForNotes);

        var noOfLeftEvent = $('.content-left').length;
        var indexForNoOfLeftEvent = 0;
        var noToGiveForNoOfLeftEvent = 1;
        do {
            var leftEventThatBelongsThere = $('.content-left').eq(indexForNoOfLeftEvent);
            leftEventThatBelongsThere.attr("id", "divForCPE" + noToGiveForNoOfLeftEvent);
            indexForNoOfLeftEvent++;
            noToGiveForNoOfLeftEvent += 2;
        } while (indexForNoOfLeftEvent < noOfLeftEvent);

        var noOfTextAreaEvent = $('textarea[name$="textAreasForEvents"]').length;
        var indexForNoOfTextAreaEvent = 0;
        do {
            var textAreaEventThatBelongsThere = $('textarea[name$="textAreasForEvents"]').eq(indexForNoOfTextAreaEvent);
            indexForNoOfTextAreaEvent++;
            textAreaEventThatBelongsThere.attr("id", "textAreaSet" + indexForNoOfTextAreaEvent);
        } while (indexForNoOfTextAreaEvent < noOfTextAreaEvent);

        var noOfRightEvent = $('.content-right').length;
        var indexForNoOfRightEvent = 0;
        var noToGiveForNoOfRightEvent = 2;
        do {
            var rightEventThatBelongsThere = $('.content-right').eq(indexForNoOfRightEvent);
            rightEventThatBelongsThere.attr("id", "divForCPE" + noToGiveForNoOfRightEvent);
            indexForNoOfRightEvent++;
            noToGiveForNoOfRightEvent += 2;
        } while (indexForNoOfRightEvent < noOfRightEvent);

        var noOfHeaderForEvent = $('.headerForEvent').length;
        var indexForHeaderForEvent = 0;
        do {
            var headerEventThatBelongsThere = $('.headerForEvent').eq(indexForHeaderForEvent);
            indexForHeaderForEvent++;
            headerEventThatBelongsThere.attr("id", "uniqueheaderForEvent" + indexForHeaderForEvent);
        } while (indexForHeaderForEvent < noOfHeaderForEvent);

        var noOfColorPickerEvent = $('input[name$="colorPickerForEvent"]').length;
        var indexForColorInputEvent = 0;
        do {
            var colorPickerEventThatBelongsThere = $('input[name$="colorPickerForEvent"]').eq(indexForColorInputEvent);
            indexForColorInputEvent++;
            colorPickerEventThatBelongsThere.attr("id", "colorForEvent" + indexForColorInputEvent);
        } while (indexForColorInputEvent < noOfColorPickerEvent);

        var timeToDisplayInCircle = $('.date').length;
        //alert(timeToDisplayInCircle);
        var hoursEntered = 0;
        var minutesEntered = 0;
        var k = 1; //start with the second circle as the first circle is automatically 0 hours 0 minutes
        var a;
        while (k < timeToDisplayInCircle) {
            //console.log("position of the duration input: k = " + k)
            for (a = k - 1; a > -1; a--) {
                //if (a > -1) {
                //console.log("postion - 1: a = " + a)
                //a is the number that is supposed to be appended to addDurationInput and addMinutesInput
                //get the duration input that is at index a and  (starting from second set)
                var hrInputAtK = $('input[name$="goDuration"]').eq(a);
                //hoursEntered += parseInt(hrInputAtK.val());
                if (hrInputAtK.val() != "") {
                    hoursEntered += parseInt(hrInputAtK.val());
                    //console.log("if (hoursEntered != 0): totalHours = " + hoursEntered)
                }
                else {
                    hoursEntered += 0;
                    //console.log("else (hoursEntered == 0): totalHours as of now = " + hoursEntered);
                }

                var minInputAtK = $('input[name$="goMinutes"]').eq(a);
                //minutesEntered += parseInt(minInputAtK.val());
                if (minInputAtK.val() != "") {
                    minutesEntered += parseInt(minInputAtK.val());
                    //console.log("if (minsEntered != 0): totalMins = " + minutesEntered)
                }
                else {
                    minutesEntered += 0;
                    //console.log("else (minsEntered == 0): totalMins as of now = " + minutesEntered)
                }
                //}

                ////a is the number that is supposed to be appended to addDurationInput and addMinutesInput
                ////get the duration input that is at index a and  (starting from second set)
                //var hrInputAtK = $('input[name$="goDuration"]').eq(a);
                ////hoursEntered += parseInt(hrInputAtK.val());
                //if (hrInputAtK.val() != "")
                //{
                //    hoursEntered += parseInt(hrInputAtK.val());
                //}
                //else
                //{
                //    hoursEntered += 0;
                //}
                //console.log("hours: " + hoursEntered);
                //var minInputAtK = $('input[name$="goMinutes"]').eq(a);
                ////minutesEntered += parseInt(minInputAtK.val());
                //if (minInputAtK.val() != "")
                //{
                //    minutesEntered += parseInt(minInputAtK.val());
                //}
                //else
                //{
                //    minutesEntered += 0;
                //}
                //console.log("minutes: " + minutesEntered)

            }
            //console.log("END FOR LOOP")
            //convert minutes into hours if the total sum of minutes input is more than 60 minutes
            var wholeNumberOfMinutes = minutesEntered / 60;
            //get the whole number only
            var roundOffVersionOfMins = Math.floor(wholeNumberOfMinutes);
            //rounded off version multiply 60 minutes
            var timeToMinusOff = roundOffVersionOfMins * 60;
            //minutesEntered - timeToMinusOff is the minutes to display in the circle
            var minsToDisplayInCircle = minutesEntered - timeToMinusOff;
            //add in hoursEntered
            var newHoursEntered = hoursEntered + roundOffVersionOfMins;

            //test through alert
            //alert(newHoursEntered + "hours" + minsToDisplayInCircle + "minutes");

            //get the circle that is at index k
            var circleAtK = $('.date').eq(k);
            circleAtK.html(newHoursEntered + " h " + minsToDisplayInCircle + " m");
            hoursEntered = 0;
            minutesEntered = 0;
            k++;
        }
        hoursEntered = 0;
        minutesEntered = 0;
        //console.log("END WHILE LOOP")

        //do {
        //    for (a = k - 1; a >= 0; ) {
        //        //a is the number that is supposed to be appended to addDurationInput and addMinutesInput
        //        //get the duration input that is at index a and  (starting from second set)
        //        var hrInputAtK = $('input[name$="goDuration"]').eq(a);
        //        hoursEntered += hrInputAtK.val();
        //        var minInputAtK = $('input[name$="goMinutes"]').eq(a);
        //        minutesEntered += minInputAtK.val();
        //        a--
        //    }
        //    //get the circle that is at index k
        //    var circleAtK = $('.date').eq(k);
        //    circleAtK.html(hoursEntered + "h" + minutesEntered + "m");
        //    k++;
        //} while (k < timeToDisplayInCircle);

        //$('#removeEventBtn1').attr("disabled", true);
        //document.getElementById('removeEventBtn1').style.cursor = "not-allowed";

    }

    var notesDescription = [];
    var notesHeader = [];
    var eventsHeader = [];
    var eventsDescription = [];
    var noteD = '{"thingsInAllNotes":[],"detailsInEvent":[],"timeInputs":[], "circleTime":[]}';

    function saveToJSON() {

        var numberOfHeadersForNotes = $('.course-content').length;
        console.log(numberOfHeadersForNotes);
        var j;
        for (var j = 1; j <= numberOfHeadersForNotes; j++) {

            if (document.getElementById('headerForNotes' + j).innerText == "") //if header no input, then take title..., 
            {
                if (tinyMCE.get('textArea' + j).getContent() == '') //both header and textarea no input
                {
                    var headerToPush = "Title...";
                    var descriptionToPush = "Notes...";
                    var backgroundColor = document.getElementById('color' + j);
                    var theColor = backgroundColor.value;
                }
                else //header no input, textarea got
                {
                    var headerToPush = "Title...";
                    var descriptionToPush = tinyMCE.get('textArea' + j).getContent();
                    var backgroundColor = document.getElementById('color' + j);
                    var theColor = backgroundColor.value;
                }
            }
            else
            {
                if (tinyMCE.get('textArea' + j).getContent() == '') //header got input, textarea no input
                {
                    var headerToPush = document.getElementById('headerForNotes' + j).innerText;
                    var descriptionToPush = "Notes...";
                    var backgroundColor = document.getElementById('color' + j);
                    var theColor = backgroundColor.value;
                }
                else {
                    var headerToPush = document.getElementById('headerForNotes' + j).innerText;
                    var descriptionToPush = tinyMCE.get('textArea' + j).getContent();
                    var backgroundColor = document.getElementById('color' + j);
                    var theColor = backgroundColor.value;
                }
                //var headerToPush = document.getElementById('headerForNotes' + j).innerText;
                //notesHeader.push(headerToPush);
            }

            //var noteD = {
            //    header: headerToPush,
            //    description: descriptionToPush
            //}

            //var noteD = {
            //    "thingsInAllNotes": [
            //        {
            //            "header": headerToPush,
            //            "description": descriptionToPush
            //        }
            //    ]
            //}

            var notesTesting = {
                header: headerToPush,
                description: descriptionToPush,
                background: theColor
            }

            //var jsonStr = '{
            //    "theTeam":[{"teamId":"1","status":"pending"},{"teamId":"2","status":"member"},{"teamId":"3","status":"member"}]
            //}';

            var obj = JSON.parse(noteD);
            //obj['thingsInAllNotes'].push({ 'header': headerToPush, 'description': descriptionToPush });
            obj['thingsInAllNotes'].push(notesTesting);
            noteD = JSON.stringify(obj);

            //notesDescription.push(noteD);

        }

        var numberOfHeadersForEvents = $('.headerForEvent').length;
        var k;

        for (k = 1; k <= numberOfHeadersForEvents; k++)
        {
            console.log(numberOfHeadersForEvents);

            if (document.getElementById('uniqueheaderForEvent' + k).innerText == "") //header no input
            {
                if (tinyMCE.get('textAreaSet' + k).getContent() == '') //both header and textarea no input
                {
                    var headerEventToPush = "Title...";
                    var descriptionEventToPush = "Notes...";
                    var backgroundColorToPush = document.getElementById('colorForEvent' + k);
                    var colorInside = backgroundColorToPush.value;

                    var eventsTesting = {
                        title: headerEventToPush,
                        detail: descriptionEventToPush,
                        divColor: colorInside
                    }
                }
                else //header no input but textarea got input
                {
                    var headerEventToPush = "Title...";
                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
                    var backgroundColorToPush = document.getElementById('colorForEvent' + k);
                    var colorInside = backgroundColorToPush.value;

                    var eventsTesting = {
                        title: headerEventToPush,
                        detail: descriptionEventToPush,
                        divColor: colorInside
                    }
                }
            }
            else //header got input
            {
                if (tinyMCE.get('textAreaSet' + k).getContent() == '') //textarea no input
                {
                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
                    var descriptionEventToPush = "Notes...";
                    var backgroundColorToPush = document.getElementById('colorForEvent' + k);
                    var colorInside = backgroundColorToPush.value;

                    var eventsTesting = {
                        title: headerEventToPush,
                        detail: descriptionEventToPush,
                        divColor: colorInside
                    }
                }
                else {
                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
                    var backgroundColorToPush = document.getElementById('colorForEvent' + k);
                    var colorInside = backgroundColorToPush.value;

                    var eventsTesting = {
                        title: headerEventToPush,
                        detail: descriptionEventToPush,
                        divColor: colorInside
                    }
                }
            }

            //if (k % 2 == 0)
            //{
            //    //means is even number (right side of the timeline, which means no start time and duration input)
            //    if (document.getElementById('uniqueheaderForEvent' + k).innerText == "") //header no input
            //    {
            //        if (tinyMCE.get('textAreaSet' + k).getContent() == '') //both header and textarea no input
            //        {
            //            var headerEventToPush = "Title...";
            //            var descriptionEventToPush = "Notes...";

            //            var eventsTesting = {
            //                title: headerEventToPush,
            //                detail: descriptionEventToPush
            //            }
            //        }
            //        else //header no input but textarea got input
            //        {
            //            var headerEventToPush = "Title...";
            //            var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();

            //            var eventsTesting = {
            //                title: headerEventToPush,
            //                detail: descriptionEventToPush
            //            }
            //        }
            //    }
            //    else //header got input
            //    {
            //        if (tinyMCE.get('textAreaSet' + k).getContent() == '') //textarea no input
            //        {
            //            var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //            var descriptionEventToPush = "Notes...";

            //            var eventsTesting = {
            //                title: headerEventToPush,
            //                detail: descriptionEventToPush
            //            }
            //        }
            //        else {
            //            var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //            var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();

            //            var eventsTesting = {
            //                title: headerEventToPush,
            //                detail: descriptionEventToPush
            //            }
            //        }
            //    }
            //}
            //else
            //{
            //    ////means is odd number and there's start and duration and minutes input
                
            //    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //var hours = document.getElementById("addDurationInput" + k).value;
            //    //var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //var startTime = document.getElementById("inputForStartTime" + k).value;
                
            //    var eventsTesting = {
            //        title: headerEventToPush,
            //        detail: descriptionEventToPush,
            //        //hour: hours,
            //        //minute: minutes,
            //        //start: startTime
            //    }

            //    ////check if header got input
            //    //if(document.getElementById('uniqueheaderForEvent' + k).innerText == "") //header no input
            //    //{
            //    //    //check if tinymce got input
            //    //    if(tinyMCE.get('textAreaSet' + k).getContent() == '') //textarea no input
            //    //    {
            //    //        //check if duration got input
            //    //        if(document.getElementById('addDurationInput' + k).value == "") //hour no input
            //    //        {
            //    //            //check if minutes got input
            //    //            if(document.getElementById('addMinutesInput' + k).value == "") //minutes no input
            //    //            {
            //    //                if(document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header no input, textarea no input, hour no input, minutes no input, start time no input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    //no need store hours, minutes and start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header no input, textarea no input, hour no input, minutes no input but start time got input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need store hours and minutes

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //            else //minutes got input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header no input, textarea no input, hour no input, minutes confirm got input and start time no input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    //no need to store hours and start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        minute: minutes
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header no input, textarea no input, hour no input, minutes confirm got input and start time got input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store hours

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        minute: minutes,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //        }
            //    //        else //hour got input
            //    //        {
            //    //            //check if minutes got input
            //    //            if (document.getElementById('addMinutesInput' + k).value == "") //minutes no input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header no input, textarea no input, hour confirm got input, minutes no input, start time no input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    //no need to store minutes and start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header no input, textarea no input, hour confirm got input, minutes no input, start time got input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store minutes 

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //            else //minutes got input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header no input, textarea no input, hours confirm got input, minutes got input, start time no input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    //no need to store start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        minute: minutes
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header no input, textarea no input, hours confirm got input, minutes got input, start time got input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        minute: minutes,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //        }
            //    //    }
            //    //    else //textarea got input
            //    //    {
            //    //        //check if duration got input
            //    //        if (document.getElementById('addDurationInput' + k).value == "") //hour no input
            //    //        {
            //    //            //check if minutes got input
            //    //            if (document.getElementById('addMinutesInput' + k).value == "") //minutes no input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header no input, textarea confirm got input, hour no input, minutes no input, start time no input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    //no need to store hours, minutes and start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header no input, textarea confirm got input, hour no input, minutes no input but start time got input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //            else //minutes got input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header no input, textarea confirm got input, hour no input, minutes got input, start time no input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    //no need to store hour and start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        minute: minutes
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header no input, textarea confirm got input, hour no input, minutes got input, start time got input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        minute: minutes,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //        }
            //    //        else //hour got input
            //    //        {
            //    //            //check if minutes got input
            //    //            if (document.getElementById('addMinutesInput' + k).value == "") //minutes no input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header no input, textarea confirm got input, hour confirm got input, minutes no input, start time no input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    //no need to store minutes and start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header no input, textarea confirm got input, hour confirm got input, minutes no input, start time got input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store minutes

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //            else //minutes got input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header no input, textarea confirm got input, hour confirm got input, minutes got input, start time no input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    //no need to store start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        minute: minutes
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header no input, textarea confirm got input, hour confirm got input, minutes got input, start time got input
            //    //                    var headerEventToPush = "Title...";
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        minute: minutes,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //        }
            //    //    }
            //    //}
            //    //else //header got input
            //    //{
            //    //    //check if tinymce got input
            //    //    if (tinyMCE.get('textAreaSet' + k).getContent() == '') //textarea no input
            //    //    {
            //    //        //check if duration got input
            //    //        if (document.getElementById('addDurationInput' + k).value == "") //hour no input
            //    //        {
            //    //            //check if minutes got input
            //    //            if (document.getElementById('addMinutesInput' + k).value == "") //minutes no input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header confirm got input, textarea no input, hour no input, minutes no input, start time no input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    //no need to store hours, minutes and start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header confirm got input, textarea no input, hour no input, minutes no input, start time got input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store hours, minutes

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //            else //minutes got input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header confirm got input, textarea no input, hour no input, minutes got input, start time no input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    //no need to store hours, start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        minute: minutes
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header confirm got input, textarea no input, hour no input, minutes got input, start time got input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store hours

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        minute: minutes,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //        }
            //    //        else //hour got input
            //    //        {
            //    //            //check if minutes got input
            //    //            if (document.getElementById('addMinutesInput' + k).value == "") //minutes no input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header confirm got input, textarea no input, hour got input, minutes no input, start time no input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    //no need to store minutes, start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header confirm got input, textarea no input, hour got input, minutes no input, start time got input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store minutes

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //            else //minutes got input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header confirm got input, textarea no input, hour got input, minutes got input, start time no input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    //no need to store start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        minute: minutes
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header confirm got input, textarea no input, hour got input, minutes got input, start time got input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = "Notes...";
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        minute: minutes,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //        }
            //    //    }
            //    //    else //textarea got input
            //    //    {
            //    //        //check if duration got input
            //    //        if (document.getElementById('addDurationInput' + k).value == "") //hour no input
            //    //        {
            //    //            //check if minutes got input
            //    //            if (document.getElementById('addMinutesInput' + k).value == "") //minutes no input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header confirm got input, textarea got input, hour no input, minutes no input, start time no input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    //no need to store hours, minutes, start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header confirm got input, textarea got input, hour no input, minutes no input, start time got input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store hours, minutes

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //            else //minutes got input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header confirm got input, textarea got input, hour no input, minutes got input, start time no input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    //no need store hours, start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        minute: minutes
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header confirm got input, textarea got input, hour no input, minutes got input, start time got input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store hours

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        minute: minutes,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //        }
            //    //        else //hour got input
            //    //        {
            //    //            //check if minutes got input
            //    //            if (document.getElementById('addMinutesInput' + k).value == "") //minutes no input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header confirm got input, textarea got input, hour got input, minutes no input, start time no input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    //no need to store minutes and start time

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header confirm got input, textarea got input, hour got input, minutes no input, start time got input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;
            //    //                    //no need to store minutes

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //            else //minutes got input
            //    //            {
            //    //                if (document.getElementById('inputForStartTime' + k).value == "") //start time no input
            //    //                {
            //    //                    //means header confirm got input, textarea got input, hour got input, minutes got input, start time no input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    //no need to store start time 

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        minute: minutes
            //    //                    }
            //    //                }
            //    //                else //start time got input
            //    //                {
            //    //                    //means header confirm got input, textarea got input, hour got input, minutes got input, start time got input
            //    //                    var headerEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
            //    //                    var descriptionEventToPush = tinyMCE.get('textAreaSet' + k).getContent();
            //    //                    var hours = document.getElementById("addDurationInput" + k).value;
            //    //                    var minutes = document.getElementById("addMinutesInput" + k).value;
            //    //                    var start = document.getElementById("inputForStartTime" + k).value;

            //    //                    var eventsTesting = {
            //    //                        title: headerEventToPush,
            //    //                        detail: descriptionEventToPush,
            //    //                        hour: hours,
            //    //                        minute: minutes,
            //    //                        start: start
            //    //                    }
            //    //                }
            //    //            }
            //    //        }
            //    //    }
            //    //}
            //}

            var obj2 = JSON.parse(noteD);
            //obj2['detailsInEvent'].push({ 'title': headerEventToPush, 'detail': descriptionEventToPush });
            obj2['detailsInEvent'].push(eventsTesting);
            noteD = JSON.stringify(obj2);

            //notesDescription.push(eventD);
        }

        //var addEventBtnItem = $('input[name$="goButton"]').length;
        var numberOfTimeInputs = $('input[name$="goTime"]').length;
        var indexForIt;

        for (var indexForIt = 1; indexForIt <= numberOfTimeInputs; indexForIt++)
        {

            if (document.getElementById('addDurationInput' + indexForIt).value == "") //means hours is empty
            {
                if (document.getElementById('addMinutesInput' + indexForIt).value == "") //means minutes is empty
                {
                    if (document.getElementById('inputForStartTime' + indexForIt).value == "") //means start time is empty
                    {
                        //1st case: hours, minutes, start time is empty
                        //no need to store anything
                        var hours = "";
                        var minutes = "";
                        var startTime = "";

                        var timeInputTesting = {
                            hour: hours,
                            minute: minutes,
                            start: startTime
                        }
                    }
                    else //means start time is not empty
                    {
                        //2nd case: hours, minutes is empty, start time is not empty
                        //store start time can already
                        var hours = "";
                        var minutes = "";
                        var startTime = document.getElementById('inputForStartTime' + indexForIt).value;

                        var timeInputTesting = {
                            hour: hours,
                            minute: minutes,
                            start: startTime
                        }
                    }
                }
                else //means minutes is not empty
                {
                    if (document.getElementById('inputForStartTime' + indexForIt).value == "") //means start time is empty
                    {
                        //3rd case: hours is empty, minutes is not empty, start time is empty
                        //store minutes can already
                        var hours = "";
                        var minutes = document.getElementById('addMinutesInput' + indexForIt).value;
                        var startTime = "";

                        var timeInputTesting = {
                            hour: hours,
                            minute: minutes,
                            start: startTime
                        }
                    }
                    else //means start time is not empty
                    {
                        //4th case: hours is empty, minutes is not empty, start time is not empty
                        //store minutes and start time can already
                        var hours = "";
                        var minutes = document.getElementById('addMinutesInput' + indexForIt).value;
                        var startTime = document.getElementById('inputForStartTime' + indexForIt).value;

                        var timeInputTesting = {
                            hour: hours,
                            minute: minutes,
                            start: startTime
                        }
                    }
                }
            }
            else //means hours is not empty
            {
                if (document.getElementById('addMinutesInput' + indexForIt).value == "") //means minutes is empty
                {
                    if (document.getElementById('inputForStartTime' + indexForIt).value == "") //means start time is empty
                    {
                        //5th case: hours is not empty, minutes is empty, start time is empty
                        //store hours can already
                        var hours = document.getElementById('addDurationInput' + indexForIt).value;
                        var minutes = "";
                        var startTime = "";

                        var timeInputTesting = {
                            hour: hours,
                            minute: minutes,
                            start: startTime
                        }
                    }
                    else //means start time is not empty
                    {
                        //6th case: hours is not empty, minutes is empty, start time is not empty
                        //store hours and start time can already
                        var hours = document.getElementById('addDurationInput' + indexForIt).value;
                        var minutes = "";
                        var startTime = document.getElementById('inputForStartTime' + indexForIt).value;

                        var timeInputTesting = {
                            hour: hours,
                            minute: minutes,
                            start: startTime
                        }
                    }
                }
                else //means minutes is not empty
                {
                    if (document.getElementById('inputForStartTime' + indexForIt).value == "") //means start time is empty
                    {
                        //7th case: hours is not empty, minutes is not empty, start time is empty
                        //store hours and minutes can already
                        var hours = document.getElementById('addDurationInput' + indexForIt).value;
                        var minutes = document.getElementById('addMinutesInput' + indexForIt).value;
                        var startTime = "";

                        var timeInputTesting = {
                            hour: hours,
                            minute: minutes,
                            start: startTime
                        }
                    }
                    else //means start time is not empty
                    {
                        //8th case: hours not empty, minutes not empty, start time not empty
                        //store everything
                        var hours = document.getElementById('addDurationInput' + indexForIt).value;
                        var minutes = document.getElementById('addMinutesInput' + indexForIt).value;
                        var startTime = document.getElementById('inputForStartTime' + indexForIt).value;

                        var timeInputTesting = {
                            hour: hours,
                            minute: minutes,
                            start: startTime
                        }

                    }
                }
            }

            var obj3 = JSON.parse(noteD);
            obj3['timeInputs'].push(timeInputTesting);
            noteD = JSON.stringify(obj3);
        }

        var numberOfCircleSpans = $('.date').length;
        var indexForCircles;

        for (var indexForCircles = 1; indexForCircles <= numberOfCircleSpans; indexForCircles++) {
            //var valueOfCircle = document.getElementById('circleForEvent' + indexForCircles).html;
            var valueOfCircle = document.getElementById('circleForEvent' + indexForCircles).innerHTML;

            var circleTesting = {
                totalTime: valueOfCircle
            }

            var obj4 = JSON.parse(noteD);
            obj4['circleTime'].push(circleTesting);
            noteD = JSON.stringify(obj4);
        }

        console.log(JSON.stringify(noteD));

        var noteDescriptionString = JSON.stringify(noteD);

        //var fs = require('fs');
        //fs.writeFile("thing.json", noteDescriptionString);

        var filename = document.getElementById('nameOfJSONFile').value;

        download(filename + ".json", noteD);
        ////alert("Success!");

        ////Storing text in the tinymce into an array
        //var numberOfTextAreaForNotes = $('textarea[name$="goTextArea"]').length;
        //var i;

        //for (i = 1; i <= numberOfTextAreaForNotes; i++)
        //{
        //    //get the id (textArea + i)
        //    //var idToInsert = "textArea" + i;
        //    //var valueOfTheSpecificTextArea = document.getElementById('textArea' + i + '_ifr').value;
        //    //notesHeader.push(valueOfTheSpecificTextArea);
        //    var testing = tinyMCE.get('textArea' + i).getContent({ format: 'text' });
        //    notesDescription.push(testing);
        //}
        ////var testing = tinyMCE.get('textArea1').getContent({format : 'text'});
        ////alert(notesHeader);
        //console.log("Things stored in notes (without image yet) " + notesDescription);
        //var notesDescriptionString = JSON.stringify(notesDescription);

        ////Storing headers of notes into an array
        //var numberOfHeadersForNotes = $('.headersNotes').length;
        //var j;

        //for (var j = 1; j <= numberOfHeadersForNotes; j++) {

        //    if (document.getElementById('headerForNotes' + j).innerText == "")
        //    {
        //        notesHeader.push("Title...");
        //    }
        //    else
        //    {
        //        var headerToPush = document.getElementById('headerForNotes' + j).innerText;
        //        notesHeader.push(headerToPush);
        //    }

        //}
        //console.log("Things stored in header " + notesHeader);
        //var notesHeaderString = JSON.stringify(notesHeader);

        ////Storing headers of events into an array 
        //var numberOfHeadersForEvents = $('.headerForEvent').length;
        //var k;

        //for (var k = 1; k <= numberOfHeadersForEvents; k++) {

        //    if (document.getElementById('uniqueheaderForEvent' + k).innerText == "") {
        //        eventsHeader.push("Title...");
        //    }
        //    else
        //    {
        //        var headerFromEventToPush = document.getElementById('uniqueheaderForEvent' + k).innerText;
        //        eventsHeader.push(headerFromEventToPush);
        //    }

        //}
        //console.log("Things stored in event header " + eventsHeader);
        //var eventsHeaderString = JSON.stringify(eventsHeader);

        ////Storing text of events into an array
        //var numberOfTextAreasForEvents = $('textarea[name$="textAreasForEvents"]').length;
        //var m;

        //for (var m = 1; m <= numberOfTextAreasForEvents; m++) {
        //    var desOfEventsToPush = tinyMCE.get('textAreaSet' + m).getContent({ format: 'text' });
        //    eventsDescription.push(desOfEventsToPush);
        //}
        //console.log("Things stored in events (without image yet) " + eventsDescription);
        //var eventsDescriptionString = JSON.stringify(eventsDescription);


        ////var fs = require('fs');
        ////fs.writeFile("testing.json", notesDescriptionString);
    }

    function loaderOffForJSON() {
        document.getElementById("overlayForJSON").style.display = "none";
    }

    function download(filename, noteDescriptionString) {
        var element = document.createElement('a');
        element.style.display = 'none';
        element.setAttribute('href', 'data:text/json;charset=utf-8,' + encodeURIComponent(noteDescriptionString));
        element.setAttribute('download', filename);
        document.body.appendChild(element);
        element.click();
        document.body.removeChild(element);
    }

    //let notes = [];
    //function saveToJSON()
    //{
    //    //alert("Hello");
    //    var numberOfTextAreaForNotes = $('textarea[name$="goTextArea"]').length;
    //    for (i = 0; i < numberOfTextAreaForNotes; i++)
    //    {
    //        var theVariable = "headerForNotes" + i;
    //        var variableForDetails = "textArea" + i
    //        let note = {
    //            header: document.getElementById(theVariable).value,
    //            details: document.getElementById(variableForDetails).value
    //        }
    //        notes.push(note);
    //    }
    //    console.log(JSON.stringify(notes));
    //}

    //$('#containerBox').on('focus', 'input[name$="goDuration"], input[name$="goMinutes"]', function () {

    //});

    //$('#containerBox').on('focus', 'input[name$="goDuration"]', function () {
    //    var idOfDurationInput = event.target.id;
    //    //alert(idOfDurationInput);
    //    //alert(testingAlarm);
    //    var noFromidOfDurationInput = idOfDurationInput.substring(16, 17);
    //    //alert(noFromidOfDurationInput);
    //    $(this).keyup(function () {
    //        //$("#testingId").val($(this).val());
    //        $("#circleForEvent" + noFromidOfDurationInput).html($(this).val());
    //        //alert("circleForEvent" + noFromidOfDurationInput);
    //    });

    //    $(this).change(function () {
    //        //$("#testingId").val($(this).val());
    //        $("#circleForEvent" + noFromidOfDurationInput).html($(this).val());
    //    });
    //});

    //$('#containerBox').on('focus', 'input[name$="goDuration"]', function () {
    //    var durationItem = document.getElementById(event.target.id);
    //    var indexOfInput = $('input[name$="goDuration"]').index(durationItem) + 1;
    //    durationItem.setAttribute("id", "addDurationInput" + indexOfInput);
    //    //alert(durationItem.getAttribute("id"));
    //});



    //function showSecondPage() {
    //    jQuery(".buttonload").hide();
    //    jQuery("input[name$='goButton']").show();
    //    //jQuery(".secondLoader").hide();
    //    //jQuery("#creatingEventLabel").hide();
    //    //jQuery(this).show();
    //    //document.getElementById("addEventBtn").style.display = "inline-block";
    //    //this.style.display = "inline-block";
    //    //document.getElementsByClassName("btn clever-btn btn-2").style.display = "inline-block";
    //    //document.getElementsByName("goButton").style.display = "block";

    //}

    //insert_divs = function () {
    //    var parent = document.getElementById("divForNewCards");
    //    var firstDiv = document.createElement('div');
    //    var secondDiv = document.createElement('div');
    //    var thirdDiv = document.createElement('div');
    //    var header4Tag = document.createElement('h4');
    //    var txtArea = document.createElement('textarea');

    //    firstDiv.style.width = 350;
    //    firstDiv.classList.add('col-12 col-md-6 col-lg-4');
    //    secondDiv.style.width = 350;
    //    secondDiv.classList.add('single-popular-course mb-100 wow fadeInUp');
    //    thirdDiv.style.width = 350;
    //    thirdDiv.classList.add('course-content');
    //    header4Tag.classList.add('headerDiv');
    //    txtArea.style.width = 300;
    //    txtArea.style.height = 300;
    //    txtArea.contentEditable = true;

    //    header4Tag.appendChild(txtArea);
    //    thirdDiv.appendChild(header4Tag);
    //    secondDiv.appendChild(thirdDiv);
    //    firstDiv.appendChild(secondDiv);
    //    parent.appendChild(firstDiv);
    //}

    //window.onload = insert_divs



</script>

</html>


