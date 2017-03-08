# Style guide

## Sizes

Standard frames are 215x250 (WxH in px) with 1px borders and 8px spacing. Entire image should have 1px border.

```ruby
def x(w)
   w*(215+2) + (w+1)*8 + 2
end
def y(h)
  h*(250+2) + (h+1)*8 + 2
end
```

It is preferred for strips to be 3 frames wide. This results in the following images sizes:

```
3x1: 685x270
3x2: 685x530
3x3: 685x790
```
