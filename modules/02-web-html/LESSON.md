# Module 02: How the web works, and HTML (Week 2)

## Why this matters

Every web app, GPIS included, is a conversation: your **browser** asks a **server** for something
and the server answers. Interviewers love the question "What happens when you type a URL into
the browser and press Enter?" By the end of this week you can answer it step by step.

## Session Learn 1 (2 hours): what happens when you open a page

**The steps, in order:**
1. **URL.** `https://example.com/students?q=adu` has 4 parts: the scheme (`https`), the host
   (`example.com`), the path (`/students`) and the query (`?q=adu`).
2. **DNS.** The computer asks "what is the IP address of example.com?" It works like a phone
   book: a name goes in, a number comes out.
3. **Connection.** The browser connects to that address. `https` adds encryption (TLS), so
   nobody on the way can read or change the data.
4. **HTTP request.** The browser sends a method and a path, e.g. `GET /students`.
5. **HTTP response.** The server sends back a **status code**, **headers** and a **body** (often
   HTML).
6. **Rendering.** The browser reads the HTML, fetches the CSS, JavaScript and images it
   mentions, and draws the page.

**Try it in Ubuntu:**

```bash
sudo apt install -y curl dnsutils
dig +short example.com              # step 2: the IP address
curl -I https://example.com         # steps 4-5: only the status and headers
curl https://example.com | head -20 # the body: real HTML
curl -I https://example.com/nothing-here
```

**Exercise 1.** What status code did the last command give? Look up what these mean and write
one line each in your journal: 200, 301, 302, 400, 401, 403, 404, 500.

**Exercise 2.** Run `curl -I https://github.com`. Find the header `content-type`. What does it
tell the browser?

**Exercise 3.** The main HTTP methods are GET, POST, PUT, PATCH and DELETE. Which one would GPIS
use to: (a) show the student list, (b) admit a new student, (c) change a student's phone number,
(d) delete a retired class?

## Session Learn 2 (2 hours): HTML

HTML describes **what things are**: a heading, a paragraph, a link, a list. It does not say how
they look; that is CSS, next week.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Page name in the browser tab</title>
  </head>
  <body>
    <header> <nav> <a href="about.html">About</a> </nav> </header>
    <main>
      <h1>One main heading per page</h1>
      <p>A paragraph.</p>
      <img src="logo.png" alt="Short description for blind users">
    </main>
    <footer>Contact details</footer>
  </body>
</html>
```

**Key ideas:**
- **Semantic tags.** `header`, `nav`, `main` and `footer` tell browsers and screen readers what
  each part is. A `div` says nothing. Use the meaningful tag when one exists.
- **`alt` text.** Every image needs it. Screen readers read it aloud to blind users.
- **The viewport `meta`.** Without it, phones show a tiny desktop page. GPIS teachers use phones,
  so this line matters.
- **Headings in order.** One `h1`, then `h2`, then `h3`. Don't skip levels just to get a smaller
  font.

**Exercise 4.** Open any website, right-click, choose **View page source**, and find the
`<title>` and the `<h1>`.

**Exercise 5.** Write a small HTML file with a table of 3 made-up students (name, class, gender)
using `<table>`, `<thead>`, `<tbody>`, `<tr>`, `<th>` and `<td>`. Open it in the browser: from
Ubuntu, run `explorer.exe file.html`.

## Build sessions (6 hours): the mini-sms home page

Work on your `week-02` branch.

Create these pages inside `mini-sms/`:
- **`index.html`:** the school home page. It has a header with the school name, a `nav` that
  links to the other two pages, a short welcome, and a footer with a made-up phone number.
- **`about.html`:** the history, vision and the head teacher's message (all made up).
- **`classes.html`:** a table of classes, from Creche to JHS 3, with a made-up class teacher for
  each.

Rules:
- Every page passes the check script (below).
- Every link works. Click them all.
- Don't use any CSS yet. It should look plain; that's correct for this week.

## Requirements drill (AI-era skill, 30 min)

A school owner sends you this message: *"I want the website to show our classes and let parents
contact us."*

Before building anything, write in your journal **5 questions** you would ask the owner. For
example: which classes, in what order? How do parents contact you: phone, email or a form? Who
answers the messages? Getting the requirement right is the part AI can't do for you.

## AI review drill (AI-era skill, 30 min)

An AI wrote this page. Find **at least 6 problems**, then write the corrected version in your
journal.

```html
<html>
<head>
<title></title>
</head>
<body>
<div class="header">GPIS</div>
<h3>Welcome</h3>
<h1>Our classes</h1>
<img src="school.jpg">
<a href="clases.html">Classes</a>
<div class="footer">Call us</div>
</body>
</html>
```

## Check your work

```bash
bash modules/02-web-html/checks/check.sh mini-sms
```

## See it in GPIS (Review session)

In the GPIS app, open a page, right-click and choose **Inspect**. Open the **Network** tab and
reload the page. Click the first request and find its method, its status code and its
`content-type`. That is everything from Learn 1, happening in a real app.

## Interview questions

1. What happens when you type a URL into the browser and press Enter?
2. What is DNS?
3. What is the difference between HTTP and HTTPS?
4. What is the difference between GET and POST?
5. What do status codes 401 and 403 mean, and how are they different?
6. What is semantic HTML, and why does it matter?
7. Why does every image need an `alt` attribute?
