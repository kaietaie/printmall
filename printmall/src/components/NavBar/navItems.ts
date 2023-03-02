import { ReactComponent as BookIcon } from './icons/book.svg';
import { ReactComponent as LikeIcon } from './icons/like.svg';
import { ReactComponent as MailIcon } from './icons/mail.svg';
import { ReactComponent as ShirtIcon } from './icons/shirt.svg';
import { ReactComponent as StoreIcon } from './icons/store.svg';
import { ReactComponent as UserIcon } from './icons/user.svg';

interface NavItem {
  label: string;
  to: string;
  icon: typeof BookIcon;
}

export const navItems: NavItem[] = [
  { label: 'Marketplace', to: '/', icon: StoreIcon },
  { label: 'Influencers', to: '/', icon: UserIcon },
  { label: 'Discounts', to: '/', icon: ShirtIcon },
  { label: 'Partnership', to: '/', icon: LikeIcon },
  { label: 'Blog', to: '/', icon: BookIcon },
  { label: 'Contact Us', to: '/', icon: MailIcon },
];
