## The Drac is Back: Project Review

* Site publication: <https://beeplosion.github.io/TheDracIsBack/>
* GitHub: <https://github.com/Beeplosion/TheDracIsBack>
* Developers: Sebastian Ortiz, Destinee Kellner, Samuel Andrew, Ruby Trumer, Anthony Vangeli, Emily Levi, Cameron Bigi
* Date of Evaluation: 2020-12-27
* Evaluated by: @ebeshero

### Document Data Modeling
This team built upon the markup we prepared for a class assignment with up-converting plain text from a Project Gutebnberg file to XML using regular expressions to find paragraph and chapter boundaries. You then continued your find and replace operations systematically to locate and tag references to main characters, locations, technology, and more, though you concentrated most systematically on the locations, characters, and technologies referenced in the novel. The result is a well-formed and well marked document, though it might benefit from a few more searches for different kinds of technology. Locating a paragraph at random, I see missed opportunities to mark references to searchlights and ships. Ships and shipping seem to be mentioned at least 72 times, and it would be easy to continue the team's method to add more markup as you discover more things. What you developed here, though, is most importantly a *good method* for applying markup using autotagging: once you locate a string to search, you find a common stem and mark as much as possible by searching to the end of the word with something like: 

```
Find: \s(ship.+?)\s
Replace: <tech>\s</tech>
```

I am impressed with the string matching work the team accomplished to convert the *Dracula* text into a source of structured document data. That made the team's work ideal for learning how to apply XPath and XSLT, and experimenting with the these technoloies. Sam's investigation (and crash course from me) in network analysis in Finals Week was all made possible by the team's good efforts with the XML markup, because that made it possible not just to highlight people, places, and tech in a readng view, but also to explore which characters are most frequently associated with which technologies in the same paragraphs. (You could do similar work to see which characters turn up most frequently in the same paragraphs with specific locations, just as you could simply list out the locations in each chapter.

### Website and teamwork issues
Things got messy, however, with the HTML, CSS< and website development, and here is where the team might have rallied more to assist each other. When I made *Dracula* available as an option for projects, I suspected it would be popular. The seven-person project team worried me because I have never known such large teams to delegate tasks evenly. My hope was that the team would divide its work, and produce two distinctly different markups of the novel, or develop two distinct websites that highlight different aspects of the novel. For example, imagine one reading view that highlights technology in the novel, and another highlighting locations and developing a web map. A team of seven might have divided its work in a way that gave more of you opportunities to take a leadership role. I should not have expected this to happen without more insistence on my part, and in future I will not permit any teams larger than four. This Dracula team really should have been two Dracula teams. It was clearly difficult for this team of seven people to define responsibilites for each team member. 

One area that clearly needed more attention in this team was the HTML and CSS development, which is by no means easy. You developed a website that displays coherently enough in web browsers, but sadly the HTML for representing the  *Dracula* novel is neither valid nor well-formed. Web browsers are largely forgiving enough even of serious HTML errors to display what they can, but the condition of the project’s text.html file really needed some attention and help, and even a forgiving web browser could not clean up the fragmented paragraphs at the end of the broken file. There might have been some help if multiple members of this team had taken responsibility for Quality Assurance. In this case that would simply have meant opening the text.html file in oXygen to view its errors and find out where they came from. One person alone might not have understood how to repair these errors, but a team meeting together *specifically* to review the pages on the website might have tracked them down and figured out how to resolve them, or found occasion to consult with me to get help fixing them. I am saddened to be writing this now because it is something I could easily have assisted you with in the final stages of the project, but someone on this team would have needed to *recognize* the HTML was seriously flawed in order to bring it to the team’s (and my) attention to seek help. 

#### Seriously damaged Dracula HTML file

There are several problems:

1) The document has not one, but two HTML `<head>` and `<body>` elements, and the two `<head>` elements contain duplicate information. This is not only completely invalid HTML, but it suggests a breakdown in communication between those responsible for the XSLT and those responsible for the website development. 

2) The document with the two heads and bodies is not well-formed, because one of the `<body>` elements never closes. The other one does, as does the outer `<html>` root element, *but the text of the file continues on* in some vestige perhaps of the old regex XML document(?) to end in the middle of a sentence, apparently duplicate material from some mid-section of the novel that does not belong in the file. You can see this easily for yourselves on your website. Scroll to the bottom of the text.html page on  <https://beeplosion.github.io/TheDracIsBack/text.html> and see how the novel seems to end right here:

```
Oh, my friend John, but it was butcher work; had I not been nerved by thoughts of other dead, and of the living over whom hung such a pall of fear, I could not have gone on. I tremble and tremble even yet, though till all was over, God be thanked, my nerve did stand. Had I not seen the repose in the first place, and the gladness that stole over it just ere the final dissolution ca
```

Opening the file in <oXygen/> I can see something of the damage. The novel ended much earlier, but there is some duplicate material appearing at least twice. The novel ends and the HTML file closes, but the extra text seems to have been grafted on after that.

3) Chapters 25, 26, and 27 are actually repeated in your HTML file even before the mess of the end of the document.

Here is a simple view of the structural problem. Your HTML file for text.html has this structure:

```xml
<html>
   <head>
       <title>Navigation></title>
       <link rel="stylesheet" type="text/css" href="commwebsite.css" />
   </head>
   <body>
       <!--Top portion navigation bar code here -->
   
        <head><!--This is the second of the two head elements and references the exact same CSS -->
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>Dracula</title>
            <link rel="stylesheet" type="text/css" href="commwebsite.css" />
       </head>
       <body><!--Here in the second body, you represent the Dracula novel -->
   
   
            <!--The ending of the novel repeats Ch. 25, 26, and 27 in your version. -->
            
  </body><!--ONE body element closes, but the other does not, so the structure of this file is not well-formed. -->
  </html>
  text continues after this point, followed by some randome <p> elements, that end in a broken <p> with a half sentence. 
```

And here is what an HTML file should look like: *one* head and *one* body:

```xml
<html>
        <head><!--This is the second of the two head elements and references the exact same CSS -->
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>Dracula</title>
            <link rel="stylesheet" type="text/css" href="commwebsite.css" />
       </head>
       <body>
            <!--Top portion navigation bar code here -->
            
            <!--Complete novel, and no extra / duplicated material -->
       
       
       </body>
</html>
```

The current *Dracula* novel HTML page is really not a good representation for the team. It is sad to see an HTML file so very broken, especially when the XML that you did was of so much better quality. 

It is difficult to understand how this happened. I looked back at the project XSLT code and ran all of the XSLT files in your repo against the Dracula.xml source document. All of them produce good, well-formed HTML, with *just one head and body* and that do not duplicate any material at the end. Your own XSLT code is sound. This is why I suggest that there seems to have been some breakdown in communication between those working on the XSLT and those working on the website. 

All that needed to happen was for the XSLT to include the top navigation bar code, so that it would output a clean, simple HTML document. I am uncertain that the document represented on your website even represents the output of the latest XSLT in your GitHub repo. Clearly there was a serious problem that this very large project team did not address.

Quality control can suffer in a large team that is not communicating effectively. I wish I could have helped you all with this, but I was unaware of the problem because no one brought it to my attention and, to be fair, because I was not looking for trouble and we were all busy and overwhelmed with a pandemic semester. Instead, I worked with one or two of you on XSLT, to make sure this was working-. Sam and I worked together on XSLT a couple of times, with the second round producing the output for Sam’s network graphs. Because I knew thew XML was sound and the XSLT was good, it never occurred to me that the HTML of your reading view would be this badly broken. I really wish *anyone* would have brought it to my attention. (PLease don’t be quiet about such things in future--not with me, not with other professors, and certainly not on the job! If you see an error, report it and pull your team together to fix it. Being open and direct is the best way to assure quality, and it is also the challenging but rewarding work of teams in real life.)

### Closing Comments
I hope that some of you will step up to repair the website damage because this project is worth it. A project like this should have a long afterlife as something more than a semester assignment. You produced an XML-based digital edition of *Dracula* that other DIGIT students will want to be learning from. Do you want those students to see a broken novel on your website? Do you want to link your potential future employers to a website edition that is so plainly broken? I will be delighted to work with any of you to repair this site.

I don’t want to end on a “down” note. There is much about this project that is not only salvageable, but really smart and admirable. The project has “good bones” in your XML markup, and Sam’s network analysis at the end demonstrates the strength of your good document data modeling. Once the HTML is repaired to honor the good XSLT work some of you did, you could revisit the CSS to make it more interesting. Why is it when you have at least three different kinds of HTML `<span>` elements (`<span class="location">`, `<span class="char">`, `<span class="tech">`) that these are all styled in exactly the same way with just one color? Shouldn’t we be able to quickly distinguish between these? You could provide a legend at the top of the page or on the main page to indicate your color coding for each of these. And you could also develop just about all of the write-up about your project: What did you learn from looking at how different characters are associated with specific technologies? What patterns stood out to you? 

I hope some of you will be willing to meet with me to take a little time to revise thie project, perhaps in preparation for the spring's upcoming DIGIT Fest presentations. If any web project is worth salvaging it is this one, on the strength of its code and document modeling under the hood. 
