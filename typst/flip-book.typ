// HFC Guidance Flip Book — Landscape A4
// A lighter, visual walkthrough of Home Front Command protocols
// Featuring Herman the Donkey and Corn the Sloth

// ──────────────────────────────────────────────
// IMAGES — relative to sibling repo
// ──────────────────────────────────────────────
#let img = "../../Israel-Wartime-Prep-Guide/images/illustrations/full-guide/"
#let cover-img = "../../Israel-Wartime-Prep-Guide/images/illustrations/full-guide/cover/a4-landscape/"
#let other-img = "../../Israel-Wartime-Prep-Guide/images/other/"

// ──────────────────────────────────────────────
// COLOURS
// ──────────────────────────────────────────────
#let navy      = rgb("#1a3a5c")
#let sky       = rgb("#2563a0")
#let soft-blue = rgb("#e8f0fe")
#let red-alert = rgb("#c0392b")
#let red-light = rgb("#fde8e8")
#let green     = rgb("#27774e")
#let green-lt  = rgb("#e8f5e9")
#let orange    = rgb("#e67e22")
#let orange-lt = rgb("#fef3e2")
#let grey      = rgb("#444444")
#let grey-lt   = rgb("#f5f5f5")
#let white     = rgb("#ffffff")
#let purple    = rgb("#6c3483")
#let purple-lt = rgb("#f4ecf7")

// ──────────────────────────────────────────────
// PAGE SETUP — Landscape A4
// ──────────────────────────────────────────────
#set page(
  width: 297mm,
  height: 210mm,
  margin: (top: 1.2cm, bottom: 1.2cm, left: 1.5cm, right: 1.5cm),
)

#set text(font: "Inter", size: 13pt, fill: grey)

// ──────────────────────────────────────────────
// HELPERS
// ──────────────────────────────────────────────

// Full-bleed page with colour background, image on one side, text on the other
// Image takes ~42% width, text takes ~58% with generous padding
#let flip-page(
  bg-colour: soft-blue,
  accent: sky,
  image-path: none,
  image-side: left,
  title: none,
  body-content: none,
  icon: none,
) = {
  page(fill: bg-colour, margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm))[
    #grid(
      columns: if image-side == left { (42%, 58%) } else { (58%, 42%) },
      rows: (100%,),
      ..if image-side == left {(
        // Image panel
        if image-path != none {
          box(width: 100%, height: 100%, clip: true)[
            #image(image-path, width: 100%, height: 100%, fit: "cover")
          ]
        } else {
          box(width: 100%, height: 100%, fill: accent.lighten(80%))[]
        },
        // Text panel — generous insets to avoid edge overrun
        box(width: 100%, height: 100%, inset: (left: 2.2cm, right: 2cm, top: 1.6cm, bottom: 1.6cm))[
          #align(left + horizon)[
            #if icon != none {
              text(size: 30pt)[#icon]
              v(0.3cm)
            }
            #if title != none {
              text(size: 28pt, weight: "bold", fill: accent)[#title]
              v(0.5cm)
            }
            #set text(size: 14.5pt, fill: grey)
            #set par(leading: 0.7em)
            #body-content
          ]
        ]
      )} else {(
        // Text panel
        box(width: 100%, height: 100%, inset: (left: 2cm, right: 2.2cm, top: 1.6cm, bottom: 1.6cm))[
          #align(left + horizon)[
            #if icon != none {
              text(size: 30pt)[#icon]
              v(0.3cm)
            }
            #if title != none {
              text(size: 28pt, weight: "bold", fill: accent)[#title]
              v(0.5cm)
            }
            #set text(size: 14.5pt, fill: grey)
            #set par(leading: 0.7em)
            #body-content
          ]
        ],
        // Image panel
        if image-path != none {
          box(width: 100%, height: 100%, clip: true)[
            #image(image-path, width: 100%, height: 100%, fit: "cover")
          ]
        } else {
          box(width: 100%, height: 100%, fill: accent.lighten(80%))[]
        }
      )}
    )
    // Page number — bottom corner on text side
    #place(bottom + right, dx: -0.8cm, dy: -0.4cm)[
      #text(size: 9pt, fill: accent.lighten(40%))[#context counter(page).display()]
    ]
  ]
}

// Text-only emphasis page (for key warnings, etc.)
#let statement-page(
  bg-colour: red-light,
  accent: red-alert,
  icon: none,
  statement: none,
  sub-text: none,
) = {
  page(fill: bg-colour, margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm))[
    #align(center + horizon)[
      #box(inset: (x: 5cm, y: 2.5cm))[
        #if icon != none {
          text(size: 56pt)[#icon]
          v(0.6cm)
        }
        #if statement != none {
          text(size: 34pt, weight: "bold", fill: accent)[#statement]
          v(0.5cm)
        }
        #if sub-text != none {
          set text(size: 18pt, fill: grey)
          set par(leading: 0.75em)
          sub-text
        }
      ]
    ]
    #place(bottom + right, dx: -0.8cm, dy: -0.4cm)[
      #text(size: 9pt, fill: accent.lighten(40%))[#context counter(page).display()]
    ]
  ]
}


// ══════════════════════════════════════════════
// PAGE 1 — COVER
// ══════════════════════════════════════════════
#page(fill: navy, margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm))[
  #grid(
    columns: (38%, 62%),
    rows: (100%,),
    box(width: 100%, height: 100%, clip: true)[
      #image(cover-img + "notext.png", width: 100%, height: 100%, fit: "cover")
    ],
    box(width: 100%, height: 100%, inset: (left: 2.5cm, right: 3cm, top: 2.5cm, bottom: 2.5cm))[
      #align(left + horizon)[
        #text(size: 42pt, weight: "bold", fill: white)[
          Staying Safe in Israel
        ]
        #v(0.6cm)
        #text(size: 19pt, fill: rgb("#a0c4e8"))[
          A visual guide to Home Front Command protocols
        ]
        #v(1.5cm)
        #text(size: 13pt, fill: rgb("#7aa8cc"))[
          Daniel Rosehill · Herman & Corn · Claude \
          Based on HFC guidance · March 2026
        ]
      ]
    ]
  )
]


// ══════════════════════════════════════════════
// PAGE 2 — MEET THE GUIDES
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: soft-blue,
  accent: sky,
  image-path: img + "returning-home.png",
  image-side: left,
  title: [Meet Your Guides],
  body-content: [
    *Herman the Donkey* is your safety expert. He knows shelters, go bags, and emergency procedures inside out.

    *Corn the Sloth* handles wellness — staying calm, taking care of yourself, and keeping things in perspective.

    They'll walk you through everything you need to know.

    #v(0.5cm)
    #text(size: 12pt, fill: sky.lighten(20%))[
      _This guide follows Home Front Command (Pikud Ha'Oref) protocols. Always follow official HFC instructions._
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 3 — GET READY IN PEACETIME
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: green-lt,
  accent: green,
  image-path: img + "regular-checks.png",
  image-side: right,
  icon: [✅],
  title: [Get Ready Now],
  body-content: [
    Don't wait for a siren. Prepare while things are calm.

    - *Find your shelters* — at home, work, and along your regular routes
    - *Download the HFC app* and set it up
    - *Pack a go bag* and keep it by the door
    - *Stock water* — 9 litres per person
    - *Walk the route* from your bed to your shelter — time it
    - *Clear hallways* of clutter and obstacles
    - *Agree a family plan* — who does what, where to meet

    #v(0.2cm)
    #block(fill: white, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: green, size: 13pt)[Preparation done in calm saves lives in chaos.]
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 4 — SHELTER PRIORITY
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: white,
  accent: navy,
  image-path: img + "which-shelter.png",
  image-side: left,
  icon: [🛡],
  title: [Shelter Priority],
  body-content: [
    Not all shelters are equal. Use the *best available option*:

    #v(0.2cm)
    *1. Mamad* (ממ"ד) — your apartment's safe room. Best protection.

    *2. Mamak* (מממ"ק) — floor-level shared safe room in a building.

    *3. Building shelter* (מקלט) — basement or ground-floor communal shelter.

    *4. Internal stairwell* — if no safe room. Stay below 3rd floor, away from windows.

    *5. Inner room* — no windows, furthest from exterior walls.

    #v(0.2cm)
    #block(fill: soft-blue, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: navy, size: 13pt)[Know your nearest 3 shelters] — home, work, and your regular route.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 5 — THE HFC APP
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: soft-blue,
  accent: sky,
  image-path: img + "red-alert-on-couchj.png",
  image-side: right,
  icon: [📱],
  title: [Get the HFC App],
  body-content: [
    The *Home Front Command app* (פיקוד העורף) is your main alert source.

    *Download it now* — don't wait for an emergency.

    *Set it up:*
    - Turn on *location services*
    - Enable *notifications* and *sound override*
    - Add up to *10 areas of interest*

    #v(0.2cm)
    #block(fill: white, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: sky, size: 13pt)[The app alerts you based on your location] — more targeted than the siren.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 6 — SIREN = MOVE
// ══════════════════════════════════════════════
#statement-page(
  bg-colour: red-light,
  accent: red-alert,
  icon: [🚨],
  statement: [When the siren sounds — move.],
  sub-text: [
    Don't check your phone. Don't look out the window. \
    Don't wait to see what happens.

    *Get to your protected space immediately.*

    You have *seconds*, not minutes.
  ],
)


// ══════════════════════════════════════════════
// PAGE 7 — HOW MUCH TIME?
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: white,
  accent: red-alert,
  image-path: img + "making-way-to-shelter.png",
  image-side: left,
  icon: [⏱],
  title: [How Much Time?],
  body-content: [
    Time between siren and impact depends on *where you are*.

    *Typical times:*
    - Gaza border: *15 seconds*
    - Central Israel: *60–90 seconds*
    - Northern Israel: *30–60 seconds*
    - Yemen / long-range: *3–5 min advance warning*, then siren

    #v(0.2cm)
    #block(fill: red-light, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: red-alert, size: 13pt)[Practice the route to your shelter.] Time yourself. Remove obstacles.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 8 — IN THE SHELTER
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: grey-lt,
  accent: navy,
  image-path: img + "leaving-shelter.png",
  image-side: right,
  icon: [🏠],
  title: [In The Shelter],
  body-content: [
    Once inside your protected space:

    - *Sit against an inner wall*, below window line
    - *Close the door* and keep it closed
    - *Do NOT use elevators*
    - *Do NOT go outside to photograph* — falling debris injures people

    *Wait for the all-clear* from HFC — via the app, official media, or the all-clear siren.

    #block(fill: soft-blue, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: navy, size: 13pt)[No signal? No update? Keep waiting.] Leaving too early is far more dangerous than staying too long.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 9 — WAITING FOR THE ALL-CLEAR
// ══════════════════════════════════════════════
#statement-page(
  bg-colour: soft-blue,
  accent: navy,
  icon: [⏳],
  statement: [Wait for the all-clear.],
  sub-text: [
    Do *not* leave your shelter until HFC confirms it's safe. \
    The all-clear comes via the app, official media, or siren.

    #v(0.3cm)
    *If you have no connectivity:* stay put. \
    *If it's been quiet for a while:* stay put. \
    *If neighbours are leaving:* stay put.

    #v(0.3cm)
    Many casualties happen because people leave too early.
  ],
)


// ══════════════════════════════════════════════
// PAGE 10 — AFTER THE ALL-CLEAR
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: white,
  accent: green,
  image-path: img + "returning-home.png",
  image-side: left,
  icon: [🔍],
  title: [After The All-Clear],
  body-content: [
    Once HFC gives the all-clear:

    *Check your home:*
    - *Smell gas?* Don't use switches or flames — leave, shut off the main valve, and call *102*
    - *See structural damage?* Don't enter — move to alternative shelter
    - *Smoke or fire?* Call *102* immediately
    - *Check windows and walls* for cracks or debris

    *Reset your readiness:*
    - Go bag back by the door
    - Phone on charge
    - Water resupplied if you drank any
    - Send a safety message to family
  ],
)


// ══════════════════════════════════════════════
// PAGE 11 — STAY READY DURING THE DAY
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: white,
  accent: sky,
  image-path: img + "daytime-posture.png",
  image-side: right,
  icon: [☀],
  title: [Stay Ready During the Day],
  body-content: [
    During an active threat, stay in a state of *readiness* — even at home.

    - *Phone on you*, charged, HFC app running
    - *Fully dressed* with *closed-toe shoes*
    - *Keys* on you or by the door
    - *Go bag* packed and by the door
    - *Hallway clear* — navigate to shelter in the dark?

    _Working from home? One earphone only. Save work often._
  ],
)


// ══════════════════════════════════════════════
// PAGE 12 — BEFORE BED
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: rgb("#1a1a2e"),
  accent: rgb("#a0c4e8"),
  image-path: img + "before-bed.png",
  image-side: left,
  title: [Before Bed],
  body-content: [
    #set text(fill: rgb("#d0d8e8"))
    Night alarms are the hardest. Set up so you can move on autopilot.

    *Every night, same routine:*
    - Clothes *laid out by the bed*
    - Closed-toe shoes *right next to the bed*
    - Torch *on the nightstand*
    - Glasses *same spot every night*
    - Phone *charging, not in airplane mode*
    - Go bag *by the front door*
    - Hallway *clear* — navigable in the dark

    #block(fill: rgb("#2a2a4e"), radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: rgb("#a0c4e8"), size: 13pt)[No earplugs.] You must hear the siren.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 13 — NIGHT ALARM
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: orange-lt,
  accent: orange,
  image-path: img + "waking-up-to-alert.png",
  image-side: right,
  icon: [🌙],
  title: [Waking Up To An Alert],
  body-content: [
    *The first 5 seconds:*
    + Siren wakes you — *don't think, move*
    + Feet on floor → *into shoes*
    + Grab *glasses* and *phone*

    *The next 15 seconds:*
    + Pull on *clothes* (whatever's laid out)
    + Grab *torch* if power is out
    + *Move to shelter* or front door

    #block(fill: white, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: orange, size: 13pt)[Don't check your phone.] The siren means go. Read details once safe.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 14 — YOUR GO BAG
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: green-lt,
  accent: green,
  image-path: img + "n95-in-backpack.png",
  image-side: left,
  icon: [🎒],
  title: [Your Go Bag],
  body-content: [
    A *backpack* — not a tote, not a suitcase. Both hands free.

    - Two shoulder straps, water-resistant
    - 30–40 litre capacity
    - Multiple compartments (find things in the dark)
    - Affix *reflective tape* to straps
    - Assign each item a *fixed pocket*

    *By the front door, zipped and ready.* \
    Check contents monthly. Rotate batteries and food.
  ],
)


// ══════════════════════════════════════════════
// PAGE 14b — GO BAG PACKLIST
// ══════════════════════════════════════════════
#{
  page(fill: white, margin: (top: 1.5cm, bottom: 1.5cm, left: 2.5cm, right: 2.5cm))[
    #text(size: 28pt, weight: "bold", fill: green)[🎒 Go Bag Packlist]
    #v(0.5cm)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 1.5cm,
      [
        #text(size: 16pt, weight: "bold", fill: navy)[Always Packed]
        #v(0.3cm)
        #set text(size: 12.5pt, fill: grey)
        #set par(leading: 0.65em)
        ☐ Phone charger + cable \
        ☐ Power bank (10,000+ mAh) \
        ☐ Essential medications (7-day) \
        ☐ Torch + spare batteries \
        ☐ N95 masks (one per person) \
        ☐ Water bottle (1L per person) \
        ☐ Emergency whistle \
        ☐ First aid kit \
      ],
      [
        #text(size: 16pt, weight: "bold", fill: navy)[Recommended]
        #v(0.3cm)
        #set text(size: 12.5pt, fill: grey)
        #set par(leading: 0.65em)
        ☐ AM/FM radio (battery/crank) \
        ☐ Cash — small bills \
        ☐ Passports / ID copies \
        ☐ Emergency contact list (printed) \
        ☐ Multi-tool or penknife \
        ☐ Duct tape + zip ties \
        ☐ Marker + paper \
        ☐ Plug adapters / splitters \
      ],
      [
        #text(size: 16pt, weight: "bold", fill: navy)[Extended Stay (4h+)]
        #v(0.3cm)
        #set text(size: 12.5pt, fill: grey)
        #set par(leading: 0.65em)
        ☐ Snacks (bars, nuts, crackers) \
        ☐ Extra water (3L/person/day) \
        ☐ Emergency blanket \
        ☐ Change of clothes + socks \
        ☐ Toiletries + wet wipes \
        ☐ Entertainment (book, cards) \
        ☐ Children's comfort item \
        ☐ Religious items (if applicable) \
      ],
    )
    #v(0.5cm)
    #block(fill: green-lt, radius: 8pt, inset: 12pt, width: 100%)[
      #text(weight: "bold", fill: green, size: 13pt)[Rotation:] Medications monthly · Food & water every 3 months · Batteries every 6 months · Documents annually
    ]
    #place(bottom + right, dx: 0cm, dy: 0cm)[
      #text(size: 9pt, fill: green.lighten(40%))[#context counter(page).display()]
    ]
  ]
}


// ══════════════════════════════════════════════
// PAGE 15 — WATER
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: soft-blue,
  accent: sky,
  image-path: img + "water-stock-up.png",
  image-side: right,
  icon: [💧],
  title: [Stock Up On Water],
  body-content: [
    *9 litres per person* for 72 hours. About three large bottles each.

    *Why?*
    - Water supply can be disrupted
    - Shops may close or run out fast
    - You may be stuck at home for days

    *Keep it* in the mamad/shelter and near the go bag. Rotate every few months.

    #block(fill: white, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: sky, size: 13pt)[Water is the \#1 supply priority.] Before food, before batteries.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 16 — MONITORING THE SITUATION
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: grey-lt,
  accent: navy,
  image-path: img + "situational-awareness.png",
  image-side: left,
  icon: [📡],
  title: [Stay Informed],
  body-content: [
    Keep track of the situation — but *don't doom-scroll*.

    *Reliable sources:*
    - *HFC app* — your primary alert tool
    - *IDF Spokesperson* — official military updates
    - *Israel Police* — local security info
    - *Established media* — Kan, Army Radio, major outlets

    *Check every 1–3 hours*, not constantly.

    #block(fill: soft-blue, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: navy, size: 13pt)[Don't trust unverified social media.] WhatsApp forwards, Telegram "breaking news", and unknown accounts spread panic and misinformation.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 17 — RESUPPLY DURING LULLS
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: white,
  accent: green,
  image-path: img + "resupplying.png",
  image-side: right,
  icon: [🛒],
  title: [Use Quiet Periods Wisely],
  body-content: [
    When there's a lull — *resupply*, don't just relax.

    *Priority order:*
    + *Water* — top up to 72-hour supply
    + *Medications* — fill prescriptions now
    + *Charge everything* — phones, power banks, torches
    + *Food* — canned goods, shelf-stable items
    + *Repack go bag* — replace anything used
    + *Fuel* — at least half a tank
    + *Cash* — ATMs may go offline

    #block(fill: green-lt, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: green, size: 13pt)[The lull may be short.] Prioritise ruthlessly.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 18 — BEFORE LEAVING HOME
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: orange-lt,
  accent: orange,
  image-path: img + "before-leaving.png",
  image-side: left,
  icon: [🚪],
  title: [Before Leaving Home],
  body-content: [
    Going out during an active threat? *Plan ahead.*

    - *Check HFC app* — alerts in your area?
    - *Know the shelters* along your route
    - *Take your go bag*
    - Phone *charged*, HFC app *running*
    - *Tell someone* where you're going
    - Car fuel: *at least half a tank*

    _Siren while outdoors? Enter the nearest building. No building? Lie flat, protect your head._
  ],
)


// ══════════════════════════════════════════════
// PAGE 19 — INFOSEC
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: purple-lt,
  accent: purple,
  image-path: img + "infosec.png",
  image-side: right,
  icon: [🔒],
  title: [Watch What You Share],
  body-content: [
    What you post online can endanger lives.

    *Never share:*
    - Exact locations of impacts
    - Military or emergency activity
    - Photos/videos revealing locations
    - Casualty info before families are notified

    *Be skeptical of:*
    - Unverified "breaking news"
    - Dramatic claims from unknown accounts
    - Forwarded screenshots

    #block(fill: white, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: purple, size: 13pt)[Stick to official sources.] Even well-intentioned sharing can be lethal.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 20 — ALERT FATIGUE
// ══════════════════════════════════════════════
#statement-page(
  bg-colour: orange-lt,
  accent: orange,
  icon: [⚡],
  statement: [Don't stop going to shelter.],
  sub-text: [
    After days of alerts, it's tempting to stop reacting. \
    This is *alert fatigue* — normal, but dangerous.

    *Civilian injuries spike in weeks 2–3* \
    when people stop sheltering.

    Treat every alert like the first one. \
    Keep your shoes on. Follow the routine. \
    The one you skip could be the one that matters.
  ],
)


// ══════════════════════════════════════════════
// PAGE 21 — LOOK AFTER YOURSELF
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: green-lt,
  accent: green,
  image-path: img + "wellness.png",
  image-side: left,
  icon: [🧘],
  title: [Look After Yourself],
  body-content: [
    Readiness includes *taking care of yourself*.

    *Body:* Sleep when you can. Eat meals even if not hungry. Stay hydrated. Move for even 10 minutes.

    *Mind:* Limit news checks. Stay connected with people. Keep small routines. "This is hard" is not weakness.

    #v(0.2cm)
    *Need help?* \
    ERAN: *1201* · NATAL: *1-800-363-363*
  ],
)


// ══════════════════════════════════════════════
// PAGE 22 — CHECK ON NEIGHBOURS
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: soft-blue,
  accent: sky,
  image-path: img + "regular-checks.png",
  image-side: right,
  icon: [👥],
  title: [Check On Neighbours],
  body-content: [
    Especially those living alone, elderly, or with limited mobility.

    *Before things escalate:*
    - Know who lives near you
    - Exchange phone numbers
    - Set up a buddy system

    *After each alert:*
    - Knock on their door — 10 seconds
    - Check food, water, medications
    - Help with tech — phone charged? HFC app?

    _Looking out for each other keeps communities safe._
  ],
)


// ══════════════════════════════════════════════
// PAGE 23 — TERRORIST INFILTRATION
// ══════════════════════════════════════════════
#statement-page(
  bg-colour: red-light,
  accent: red-alert,
  icon: [⚠],
  statement: [Terrorist Infiltration =\ Different Protocol],
  sub-text: [
    This is *not* the same as a rocket alert.

    *Indoors:* Lock the door. Enter the mamad. Stay hidden. \
    *Outdoors:* Enter the nearest building immediately. \
    *In a car:* Drive to safety or stop and seek shelter.

    *Do NOT leave* until authorities announce it's over. \
    *Do NOT share your location* on social media. \
    *Do NOT remove the mamad door handle* — barricade it.
  ],
)


// ══════════════════════════════════════════════
// PAGE 24 — DRONES / UAV
// ══════════════════════════════════════════════
#flip-page(
  bg-colour: grey-lt,
  accent: navy,
  image-path: img + "quick-checks.png",
  image-side: left,
  icon: [✈],
  title: [Hostile Drone Alert],
  body-content: [
    UAV/drone alerts use the *same siren* as rockets and follow the *same shelter procedure*.

    - *Indoors:* Go to shelter immediately
    - *Outdoors (city):* Enter nearest building — *not the entrance hall*
    - *Outdoors (open):* Lie flat, protect your head
    - *In a car:* Stop, exit, find shelter. If none — move away from car, lie flat

    #block(fill: soft-blue, radius: 8pt, inset: 10pt)[
      #text(weight: "bold", fill: navy, size: 13pt)[Stay for 10 minutes] or until the all-clear — whichever is later.
    ]
  ],
)


// ══════════════════════════════════════════════
// PAGE 25 — KEY NUMBERS
// ══════════════════════════════════════════════
#{
  page(fill: soft-blue, margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm))[
    #align(center + horizon)[
      #box(inset: (x: 4cm, y: 2.5cm))[
        #text(size: 32pt, weight: "bold", fill: navy)[Emergency Numbers]
        #v(0.8cm)
        #set text(size: 20pt, fill: grey)
        #table(
          columns: (auto, auto),
          stroke: none,
          row-gutter: 14pt,
          column-gutter: 2cm,
          align: (right, left),
          text(weight: "bold", fill: navy)[100], [Police (Moked)],
          text(weight: "bold", fill: navy)[101], [Magen David Adom (Ambulance)],
          text(weight: "bold", fill: navy)[102], [Fire & Rescue],
          text(weight: "bold", fill: navy)[104], [Home Front Command],
          text(weight: "bold", fill: navy)[1201], [ERAN — Emotional Support],
          text(weight: "bold", fill: red-alert)[1-800-363-363], [NATAL — Trauma Helpline],
          text(weight: "bold", fill: navy)[\*8840], [Senior Citizens Helpline],
          text(weight: "bold", fill: navy)[118], [Welfare Ministry],
        )
      ]
    ]
    #place(bottom + right, dx: -0.8cm, dy: -0.4cm)[
      #text(size: 9pt, fill: sky.lighten(40%))[#context counter(page).display()]
    ]
  ]
}


// ══════════════════════════════════════════════
// PAGE 26 — BACK COVER
// ══════════════════════════════════════════════
#page(fill: navy, margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm))[
  #align(center + horizon)[
    #box(inset: 2.5cm)[
      #text(size: 30pt, weight: "bold", fill: white)[
        Stay safe. Stay ready. \
        Look after each other.
      ]
      #v(1cm)
      #text(size: 15pt, fill: rgb("#7aa8cc"))[
        Based on Home Front Command guidance \
        oref.org.il · HFC App (פיקוד העורף)
      ]
      #v(0.8cm)
      #text(size: 12pt, fill: rgb("#5a8aaa"))[
        Created by Daniel Rosehill + Claude \
        With Herman & Corn · March 2026 \
        #v(0.3cm)
        _This is a community resource, not official government guidance._ \
        _Always follow current HFC instructions._
      ]
      #v(0.8cm)
      #image(other-img + "beyahad.png", height: 1.5cm)
    ]
  ]
]

// ══════════════════════════════════════════════
// CREDITS / AUTHORS PAGE
// ══════════════════════════════════════════════
#page(fill: navy, margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm))[
  #align(center + horizon)[
    #box(inset: (x: 4cm, y: 2cm))[
      #text(size: 32pt, weight: "bold", fill: white)[About]
      #v(1.2cm)

      #text(size: 16pt, weight: "bold", fill: rgb("#a0c4e8"))[Daniel Rosehill]
      #v(0.2cm)
      #text(size: 13pt, fill: rgb("#7aa8cc"))[
        danielrosehill.com \
        Jerusalem, Israel
      ]

      #v(1cm)
      #text(size: 16pt, weight: "bold", fill: rgb("#a0c4e8"))[Herman & Corn]
      #v(0.2cm)
      #text(size: 13pt, fill: rgb("#7aa8cc"))[
        Co-hosts of the My Weird Prompts podcast \
        myweirdprompts.com
      ]

      #v(1cm)
      #text(size: 16pt, weight: "bold", fill: rgb("#a0c4e8"))[🤖 Claude (Anthropic)]
      #v(0.2cm)
      #text(size: 13pt, fill: rgb("#7aa8cc"))[
        Built with Claude Opus 4.6 \
        anthropic.com
      ]
    ]
  ]
]
