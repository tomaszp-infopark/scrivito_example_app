class HierarchyPagesCreator < BaseSeedContentCreator

  def create
    create_hierarchy_page("hierarchy", [
      create_hierarchy_page("hierarchy/1", [
        create_hierarchy_page("hierarchy/1/1", [
          create_hierarchy_page("hierarchy/1/1/1", [
            create_hierarchy_page("hierarchy/1/1/1/1"),
            create_hierarchy_page("hierarchy/1/1/1/2"),
            create_hierarchy_page("hierarchy/1/1/1/3"),
            create_hierarchy_page("hierarchy/1/1/1/4"),
          ]),
          create_hierarchy_page("hierarchy/1/1/2"),
          create_hierarchy_page("hierarchy/1/1/3"),
          create_hierarchy_page("hierarchy/1/1/4"),
          create_hierarchy_page("hierarchy/1/1/5"),
          create_hierarchy_page("hierarchy/1/1/6"),
          create_hierarchy_page("hierarchy/1/1/7"),
        ]),
        create_hierarchy_page("hierarchy/1/2"),
        create_hierarchy_page("hierarchy/1/3"),
        create_hierarchy_page("hierarchy/1/4"),
        create_hierarchy_page("hierarchy/1/5"),
        create_hierarchy_page("hierarchy/1/6"),
        create_hierarchy_page("hierarchy/1/7"),
        create_hierarchy_page("hierarchy/1/8"),
        create_hierarchy_page("hierarchy/1/9"),
      ]),
      create_hierarchy_page("hierarchy/2"),
      create_hierarchy_page("hierarchy/3"),
    ])
  end

  def create_hierarchy_page(path, child_order=nil)
    puts("creating hierarchy page #{path}")
    Page.create({
      _path: ("/" + path),
      title: "Page #{path.gsub("hierarchy/", "").gsub("/", "-")}",
      child_order: child_order,
      display_breadcrumb_and_title: "yes",
      tags: %w[hierarchy navigation-widget],
      body: [
        SectionWidget.new({
          content: [
            ColumnWidget.new({
              column1: [
                NavigationWidget.new
              ],
              column2: [
                create_h3("Sample Page Hierarchy"),
                create_text(%{
<p>
With Scrivito, you can structure website content hierarchically, meaning that pages are connected
to each other, creating a tree-like formation, root at the top. Organizing pages like
this is useful for presenting content in a top-down manner, moving from the general to the
specific (and to the even more specific if required). Technically, a hierarchy can be constructed
by specifying a path for each page it should contain, e.g. "/about-us/career", where "/" is the
homepage, "about-us" a top-level page, and "career" a subpage of "about-us". Every page can act as
the parent of subpages, its child pages.
</p>

<p>
This demo wants to give you an impression of how parent-child-based navigations work for
editors. In editing mode, such navigations can be identified by a blue handle and a frame of
the same color that shows up as the mouse pointer hovers over a navigation area. Take a look at
the first of the three top-level subpages in the "Page Hierarchy" menu (you're possibly viewing
it right now): After selecting "Page 1" from the menu, a navigation is rendered for its
subpages on the right hand side of the page. Clicking the first item of this navigation reveals
another hierarchy level – there are four of them in total. For returning to any of the parent
pages, a breadcrumb navigation is rendered underneath the main navigation.
</p>

<p>
Clicking the blue menu handle lets you either add a page or sort the navigation items. For
sorting, a dialog shows up in which you can drag and drop subpages to a different position
within the navigation.
</p>
}),
              ],
              column1_width: 3,
              column2_width: 9,
              column3_width: 0,
            }),
          ],
        }),
      ],
    })
  end

end
