// порівняння на основі шаблону
export default function sortBySize (prodObj) {
    const sizes = ["XS", "S", "M", "L", "XL", "XXL"];
    const sortedObj = { ...prodObj };
    for (const color in sortedObj.size_color) {
      sortedObj.size_color[color].sort(
        (a, b) => sizes.indexOf(a) - sizes.indexOf(b)
      );
    }
    console.log(sortedObj)
    return sortedObj;
  };