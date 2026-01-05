---
name: review-post-image
description: |
  Review a post image for LinkedIn specs and content fit.
  Invoke after drafting post text.
---

# Review Post Image

## Setup

**Ask:** "Share or describe the image you're considering for this post"

[Wait — user can paste image, share path, or describe]

---

## Phase 1: Technical Check

**LinkedIn image requirements:**

| Type | Dimensions | Max Size |
|------|------------|----------|
| Square | 1080 x 1080 px | 8 MB |
| Portrait | 1920 x 1080 px | 8 MB |
| Landscape | 1200 x 626 px | 8 MB |

**Check:**
- [ ] Dimensions meet requirements
- [ ] File size under 8 MB
- [ ] Format is PNG or JPG

**If viewing actual image:** Report dimensions and pass/fail

**If URL in post — Link Preview Check:**

"If your post contains a URL, the preview image uses OG tags."

**Requirements:**
- og:image minimum: 1200 x 627 px
- Check via: https://www.linkedin.com/post-inspector/ (requires login)

**Ask:** "Does your URL have proper OG tags? (Run Post Inspector to check)"

[Wait for response]

---

## Phase 2: Content Fit

**If image provided:**

Review against post content:
- Does image reinforce the post's message?
- Is there text on the image? Is it readable at small sizes?
- For photos with faces: Are they cropped appropriately?

**Ask:** "What do you want this image to convey?"

[Wait for response]

**Give feedback:** Does image match stated intent?

---

## Phase 3: Recommendations

Based on review, suggest:
- Crop adjustments if needed
- Alternative image approaches
- Whether image adds value or is unnecessary

**Ask:** "Good to go, or want to adjust?"

[Wait — iterate if needed]
