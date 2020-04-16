using Newtonsoft.Json.Linq;
using Spire.Doc;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace LXD_Lesson_Plan
{
    public partial class LXD_LessonPlan : System.Web.UI.Page
    {
        private List<string> ControlsList5
        {
            get
            {
                if (ViewState["controls"] == null)
                {
                    ViewState["controls"] = new List<string>();
                }
                return (List<string>)ViewState["controls"];
            }
        }

        private int NextID5
        {
            get
            {
                return ControlsList5.Count + 1;

            }

        }

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
        }

        protected override void LoadViewState(object savedState)
        {
            base.LoadViewState(savedState);

            //foreach (string txtID in ControlsList)
            //{
            //    TextBox txt = new TextBox();
            //    txt.ID = txtID;
            //    phForNewCards.Controls.Add(txt);
            //    phForNewCards.Controls.Add(new LiteralControl("<br>"));
            //}

            //foreach (string divID in ControlsList1)
            //{
            //    HtmlGenericControl div = new HtmlGenericControl("div");
            //    div.ID = divID;
            //    div.Attributes["class"] = "col-12 col-md-6 col-lg-4";
            //    phForNewCards.Controls.Add(div);

            //    foreach (string div2ID in ControlsList2)
            //    {
            //        HtmlGenericControl div2 = new HtmlGenericControl("div");
            //        div2.ID = div2ID;
            //        div2.Attributes["class"] = "single-popular-course mb-100 wow fadeInUp";
            //        div.Controls.Add(div2);

            //        foreach (string div3ID in ControlsList3)
            //        {
            //            HtmlGenericControl div3 = new HtmlGenericControl("div");
            //            div3.ID = div3ID;
            //            div3.Attributes["class"] = "course-content";
            //            div2.Controls.Add(div3);

            //            foreach (string header4ID in ControlsList4)
            //            {
            //                var h4 = new HtmlGenericControl("h4");
            //                h4.ID = header4ID;
            //                h4.Attributes["class"] = "headerDiv";
            //                h4.Attributes["contenteditable"] = "true";
            //                div3.Controls.Add(h4);
            //                //div3.Controls.Add(new LiteralControl("<hr>"));

            //                foreach (string txtID in ControlsList5)
            //                {
            //                    TextBox txt = new TextBox();
            //                    txt.ID = txtID;
            //                    txt.TextMode = TextBoxMode.MultiLine;
            //                    div3.Controls.Add(txt);
            //                }
            //            }
            //        }
            //    }
            //}
            //Debug.Write("From LoadViewState Method: " + NextID.ToString());

            //foreach (string header4ID in ControlsList4)
            //{
            //    var h4 = new HtmlGenericControl("h4");
            //    h4.ID = header4ID;
            //    h4.Attributes["class"] = "headerDiv";
            //    h4.Attributes["contenteditable"] = "true";
            //    phForNewCards.Controls.Add(h4);
            //    //div3.Controls.Add(new LiteralControl("<hr>"));

            //    foreach (string txtID in ControlsList5)
            //    {
            //        TextBox txt = new TextBox();
            //        txt.ID = txtID;
            //        txt.TextMode = TextBoxMode.MultiLine;
            //        phForNewCards.Controls.Add(txt);
            //    }
            //}


            //foreach (string txtID in ControlsList5)
            //{
            //    TextBox txt = new TextBox();
            //    txt.ID = txtID;
            //    txt.Width = 350;
            //    txt.Height = 300;
            //    txt.Style.Add("margin-left", "inherit");
            //    txt.Style.Add("margin-right", "inherit");
            //    txt.Style.Add("float", "inherit");
            //    txt.TextMode = TextBoxMode.MultiLine;
            //    //txt.CssClass = "course-content";
            //    txt.Attributes.Add("class", "row col-12 col-md-6 col-lg-4 single-popular-course mb-100 wow fadeInUp course-content");
            //    //phForNewCards.Controls.Add(txt);
            //    //divForCards.Controls.Add(txt);
            //}
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (IsPostBack)
            //{
            //    // NOTE: the following uses an overload of RegisterClientScriptBlock() 
            //    // that will surround our string with the needed script tags 
            //    ClientScript.RegisterClientScriptBlock(GetType(), "IsPostBack", "var isPostBack = true;", true);
            //}


            //int containers = 11;

            //ispostback means if it will check if the page load method is trigerred by a button event or not,
            //if(!Page.IsPostBack) //if its not postback, means page load is run the first time, then no need to do anything
            //{

            //}
            //else //else if it is postback, means a button event triggered the page load method, then do the following
            //{




            //Successfully gotten the filename that user wants to load
            //Debug.WriteLine("The JSON File to load is " + FileUpload1.FileName);

            //var json = File.ReadAllText(FileUpload1.FileName);
            //var json = Server.MapPath(@"~/FileUpload1.FileName");

            //var path = Server.MapPath(@"~/FileUpload1.FileName");

            //using (StreamReader sr = new StreamReader(path, true))
            //{
            //    String line = sr.ReadToEnd();
            //    Debug.WriteLine(line);
            //}

            //var path = Server.MapPath(FileUpload1.FileName);
            //string[] paths = { @"~/", FileUpload1.FileName };
            //string fullPath = Path.Combine(paths);
            //using (StreamReader sr = new StreamReader(Server.MapPath(fullPath)))
            //{
            //    try
            //    {
            //        var jObject = JObject.Parse(FileUpload1.FileName);

            //        if (jObject != null)
            //        {
            //            JArray thingsInAllNotesArray = (JArray)jObject["thingsInAllNotes"];
            //            if (thingsInAllNotesArray != null)
            //            {
            //                foreach (var item in thingsInAllNotesArray)
            //                {
            //                    Debug.WriteLine("Header is: " + item["header"].ToString());
            //                    Debug.WriteLine("Description is: " + item["description"].ToString());
            //                }
            //            }
            //        }
            //        else
            //        {

            //        }
            //    }
            //    catch (Exception)
            //    {

            //        throw;
            //    }
            //}

            //var json = JSON.parse(Storage.readSync(FileUpload1.FileName));

            //var json = FileSystem.readTextFromFileSync(FileSystem.dataDirectory);

            //try
            //{
            //    var jObject = JObject.Parse(FileUpload1.FileName);

            //    if (jObject != null)
            //    {
            //        JArray thingsInAllNotesArray = (JArray)jObject["thingsInAllNotes"];
            //        if (thingsInAllNotesArray != null)
            //        {
            //            foreach (var item in thingsInAllNotesArray)
            //            {
            //                Debug.WriteLine("Header is: " + item["header"].ToString());
            //                Debug.WriteLine("Description is: " + item["description"].ToString());
            //            }
            //        }
            //    }
            //    else
            //    {

            //    }
            //}
            //catch (Exception)
            //{

            //    throw;
            //}
            //}
        }

        //private int counter = 1;

        //protected void saveToXMLBtn(object sender, EventArgs e)
        //{
        //    Document doc = new Document();
        //    doc.LoadFromFile("LXD_LessonPlan.aspx");
        //    doc.SaveToFile("test.xml", FileFormat.Xml);

        //}

        //protected void saveToJSON(object sender, EventArgs e)
        //{
               
        //}

        protected void browseFileBtn_Click(object sender, EventArgs e)
        {
            //OpenFileDialog openFileDialog1 = new OpenFileDialog();
            //System.Diagnostics.Process.Start("explorer.exe","c:\\Documents");
            //jsonFileToView.Value = FileUpload1.FileName;
            
            //FileUpload1.FileName to get the filename given, pass it to the json read method or something
        }

        protected void viewJSONFile_Click(object sender, EventArgs e)
        {
            Debug.WriteLine("Successfully shown this message");
        }

        protected void btnGenerateDiv_Click(object sender, EventArgs e)
        {
            //System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            //dynDiv.Attributes["class"] = "course-content";
            //dynDiv.InnerHtml = "Dynamically generated DIV";
            //this.Controls.Add(dynDiv);
            //HtmlGenericControl dynDiv = new HtmlGenericControl("div");
            //dynDiv.Attributes["class"] = "course-content";
            //dynDiv.InnerHtml = "Dynamically created";
            //ControlContainer.Controls.Add(dynDiv);
            //i++;
            //HtmlGenericControl dynDiv = new HtmlGenericControl("div");
            //dynDiv.ID = "dynamicDiv" + i;
            //dynDiv.InnerHtml = "This is a dynamically created DIV";
            //ControlContainer.Controls.Add(dynDiv);
            //Response.Redirect("WebForm1.aspx");


            //phForNewCards.Visible = true;
            //divForNewCards.Visible = true;

            //StringBuilder sb = new StringBuilder();
            ////sb.Append("<script type='text/javascript'>function SaveWithParameter(parameter){__doPostBack('btnNum', parameter)}</script>");
            

            ////start of 1st div
            //sb.Append("<div class='col-12 col-md-6 col-lg-4' style='width: 350px'>");

            ////end of 2nd div
            //sb.Append("<div class='single-popular-course mb-100 wow fadeInUp' data-wow-delay='750ms' style='width: 350px'>");

            ////start of 3rd div
            //sb.Append("<div class='course-content' style='width: 350px'>");

            ////start of header
            //sb.Append("<h4 contenteditable='true' class='headerDiv'>");

            ////start of textarea
            //sb.Append("<textarea contenteditable='true' data-placeholder='Your Notes' style='width: 300px; height: 300px' id='"+counter+"'>");

            ////end of textarea
            //sb.Append("</textarea>");

            ////end of header
            //sb.Append("</h4>");

            ////end of 3rd div
            //sb.Append("</div>");

            ////end of 2nd div
            //sb.Append("</div>");

            ////end pf 1st div
            //sb.Append("</div>");

            //counter++;


            //TextBox txt = new TextBox();
            //txt.ID = "TextBox" + NextID.ToString();
            //phForNewCards.Controls.Add(txt);
            //phForNewCards.Controls.Add(new LiteralControl("<br>"));

            //ControlsList.Add(txt.ID);
            //Debug.Write("The txt id is: " + NextID.ToString() + ".....");
            //Debug.Write("From generate div method: " + ControlsList.Count + "...");



            ////Div for class col-12 col-md-6 col-lg-4
            //HtmlGenericControl div = new HtmlGenericControl("div");
            //div.ID = "Div1" + NextID1.ToString();
            //div.Attributes["class"] = "col-12 col-md-6 col-lg-4";
            //phForNewCards.Controls.Add(div);
            //ControlsList1.Add(div.ID);

            ////Debug.Write("Id of Div1 is: " + NextID.ToString() + ".....");
            ////Debug.Write("From generate div method: " + ControlsList.Count + "...");

            ////Div for class single-popular-course mb-100 wow fadeInUp
            //HtmlGenericControl div2 = new HtmlGenericControl("div");
            //div2.ID = "Div2" + NextID2.ToString();
            //div2.Attributes["class"] = "single-popular-course mb-100 wow fadeInUp";
            //div.Controls.Add(div2);
            //ControlsList2.Add(div2.ID);


            ////Div for class course-content
            //HtmlGenericControl div3 = new HtmlGenericControl("div");
            //div3.ID = "Div3" + NextID3.ToString();
            //div3.Attributes["class"] = "course-content";
            //div2.Controls.Add(div3);
            //ControlsList3.Add(div3.ID);


            ////H4
            //var h4 = new HtmlGenericControl("h4");
            //h4.ID = "headerFourTag" + NextID4.ToString();
            //h4.Attributes["class"] = "headerDiv";
            //h4.Attributes["contenteditable"] = "true";
            //div3.Controls.Add(h4);
            ////div3.Controls.Add(new LiteralControl("<hr>"));
            //ControlsList4.Add(h4.ID);


            ////TextArea
            //TextBox txt = new TextBox();
            //txt.ID = "TextArea" + NextID5.ToString();
            //txt.TextMode = TextBoxMode.MultiLine;
            //div3.Controls.Add(txt);
            //ControlsList5.Add(txt.ID);

            //Debug.Write("From Generate Div Method: " + ControlsList.Count + "things inside list");
            //Debug.Write("ID of DIV 1: " + div.ID);
            //Debug.Write("ID of DIV 2: " + div2.ID);
            //Debug.Write("ID of DIV 3: " + div3.ID);
            //Debug.Write("ID of header4: " + h4.ID);
            //Debug.Write("ID of textarea: " + txt.ID);


            //H4
            //var h4 = new HtmlGenericControl("h4");
            //h4.ID = "headerFourTag" + NextID4.ToString();
            //h4.Attributes["class"] = "headerDiv";
            //h4.Attributes["contenteditable"] = "true";
            //phForNewCards.Controls.Add(h4);
            ////div3.Controls.Add(new LiteralControl("<hr>"));
            //ControlsList4.Add(h4.ID);

            ////TextArea
            //TextBox txt = new TextBox();
            //txt.ID = "TextArea" + NextID5.ToString();
            //txt.Width = 350;
            //txt.Height = 300;
            //txt.Style.Add("margin-left", "inherit");
            //txt.Style.Add("margin-right", "inherit");
            //txt.TextMode = TextBoxMode.MultiLine;
            ////txt.CssClass = "course-content";
            //txt.Attributes.Add("class", "row col-12 col-md-6 col-lg-4 single-popular-course mb-100 wow fadeInUp course-content");
            ////phForNewCards.Controls.Add(txt);
            ////divForCards.Controls.Add(txt);
            //ControlsList5.Add(txt.ID);
        }
    }
}