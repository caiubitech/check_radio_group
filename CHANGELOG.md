
## [2.0.0]
- Mandatory implementation of the onSelectedItem function removed. 
- The onSelectedItem function will be available by use, but is deprecated. // It doesn't make sense to return just one item when the component is multiple-selection. We will definitely remove it in the next version

- Add new function onSelectedItems // As the component is multiple selection, it makes more sense to return the list of selected items

## [1.0.5]
- First version