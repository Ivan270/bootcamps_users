import tailwindForms from '@tailwindcss/forms';
/** @type {import('tailwindcss').Config} */

export default {
	content: ['./app/views/**/*.handlebars', './app/views/main.handlebars'],
	theme: {
		extend: {
			backgroundImage: {
				laptop:
					'url("https://images.unsplash.com/photo-1496917756835-20cb06e75b4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9")',
				bootcamp: 'url("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fdreamztech.com.my%2Fimages%2F1_Dreamztech%2Fcareer%2Fprogrammers.png&f=1&nofb=1&ipt=a5472c3e23b57a95f7c9ed888a25f2ca691ef0b0a8e1b2fde3dfb7a43a83d8f1&ipo=images")'
			},
		},
	},
	plugins: [tailwindForms],
};
