# Objective

* Make learning personalized (ie: not teaching to the middle), scalable (ie: not one person talking to 20 kids), and fun (ie: gamified)

# Next

* show: all of your solutions, other solutions that are approved and public
* solutions have points: 0=no, 1=yes, 1.2=double yes; points=base (from challenge) x points
* tie ajax buttons to controller actions
* user can delete their submissions (deleted_at)
* user can like submissions
* denormalize username on submission to show "{name} sent {time ago}"
* user has cumulative points; denormalize for speed (store in a hash in the user; precalculate total)
* user leaderboard
* challenges have comments
* import challenges from Khan Academy
* import challenges from Codecademy
* import challenges from notes
* creating a user saves username

---

# Lessons

* italic, underline, link, header, image, hr, br, ul/li, table, div
*

---

# Inbox

* users can create challenges for themselves; private for them unless I make them public
* admin guards on controller actions
* I can give users emoji badges
* way to submit surveys?
* submission default is_public changes with each submission; remembers for the next one
* users can set their own XP goals? for the class? for the day?
* users can privately message me saying someone else deserves a badge, like helping
* notifications (web sockets?)
* submissions have comments (pop up in model)
* send score updates through websockets
