export default (
  strings: TemplateStringsArray,
  ...classes: string[]
): string => {
  return strings
    .reduce(
      (result, value, index) =>
        `${result}${value}${classes[index] ? classes[index] : ''}`,
      ''
    )
    .trim()
    .replace(/\s\s+/g, ' ');
};
