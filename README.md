# CaseFormBug

Using `case` inside of a LiveView form doesn't seem to work.

See the file `lib/case_form_bug_web/templates/person/new.html.leex`. This works:


```html
<%= f = form_for @changeset, "#", [phx_change: :validate, phx_submit: :save] %>

  ...

  <%= if @show_color do %>
      <%= label f, :favorite_color %>
      <%= text_input f, :favorite_color %>
      <%= error_tag f, :favorite_color %>
  <% else %>
          Nothing to see here
  <% end %>

  ...

</form>
```

However, if I use a `case` statement instead of the `if`:

```html
  <%= case @show_color do %>
     <% true -> %>
       <%= label f, :favorite_color %>
       <%= text_input f, :favorite_color %>
       <%= error_tag f, :favorite_color %>
     <% false -> %>
       Nothing to see here
  <% end %>
```

The form *renders* just fine, but when you type something into the "Favorite Color" field, and then try to enter text into another field, the text entered into the "Favorite Color" field disappears. Additionally, no "can't be blank" error appears under the text input field after editing.

This bug appears in Safari and Firefox. (Chrome, Edge, and IE not tested.)
