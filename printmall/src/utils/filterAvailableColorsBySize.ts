import { Color } from '../types/Product';

export default function filterAvailableColorsBySize(
  colors: Color[],
  productSize: string,
  size_color: { [key: string]: string[] }
): Color[] {
  const availableColors = size_color[productSize];
  return colors.filter((color) => availableColors?.includes(color.color));
}
