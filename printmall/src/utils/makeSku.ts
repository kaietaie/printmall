interface makeSkuProps {
  seller_id: number;
  product_id: number;
  product_size: number;
  product_color: number;
}

export default function makeSku({
  seller_id,
  product_id,
  product_size,
  product_color,
}: makeSkuProps) {
  return `${seller_id}-${product_id}-${product_size}-${product_color}`;
}
