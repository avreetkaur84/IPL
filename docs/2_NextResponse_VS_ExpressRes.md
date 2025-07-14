# 🧾 Next.js `NextResponse` vs Express `res` — Quick Reference Guide

## 📌 What is `NextResponse`?

`NextResponse` is a class provided by `next/server` in Next.js App Router. It helps you create and send HTTP responses in API routes or middleware.

It replaces the role of Express’s `res` object.

---

## 🔁 Quick Comparison: `NextResponse` vs `res`

| Feature         | Express (`res`)              | Next.js (`NextResponse`)                   |
| --------------- | ---------------------------- | ------------------------------------------ |
| Send JSON       | `res.json(data)`             | `NextResponse.json(data)`                  |
| Set status code | `res.status(500).json()`     | `NextResponse.json(data, { status: 500 })` |
| Redirect        | `res.redirect('/login')`     | `NextResponse.redirect('/login')`          |
| Set Headers     | `res.set('Header', 'Value')` | `NextResponse.json(data, { headers })`     |
| Streaming       | `res.write()`                | ❌ (not supported yet)                      |

---

## 💡 Usage in Next.js API Route

```js
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    const data = await getDataFromDB();
    return NextResponse.json({ success: true, data });
  } catch (err) {
    return NextResponse.json(
      { success: false, error: err.message },
      { status: 500 }
    );
  }
}
```

---

## 🔍 Real-World Comparison

### 📦 Express Example:

```js
app.get('/api/players', async (req, res) => {
  try {
    const players = await getPlayers();
    res.status(200).json({ success: true, data: players });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});
```

### ⚡ Next.js API Route (App Router):

```js
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    const players = await getPlayers();
    return NextResponse.json({ success: true, data: players });
  } catch (err) {
    return NextResponse.json({ success: false, error: err.message }, { status: 500 });
  }
}
```

---

## 📘 When to Use `NextResponse`

* In `/app/api/` routes
* In middleware (redirects, rewrites, headers)
* When working in **Next.js App Router** (not Pages Router)

---

## ✅ TL;DR

* `NextResponse` = Next.js version of `res`
* It’s cleaner, functional, and works in the modern serverless world
* Use `.json()`, `.redirect()`, and status inside the return statement

---

## 🧠 Pro Tip

You **don’t call** `res.status().json()` in Next — you **return** `NextResponse.json()` directly. This is because the API handler is a server function — not a request listener like Express.

---