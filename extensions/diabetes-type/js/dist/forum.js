// Minimal, bundler-free JS. Reads `diabetes_type` from the API and shows it
(function () {
  const apiBase =
    (window.app && app.forum && app.forum.attribute && app.forum.attribute('apiUrl')) ||
    '/api';

  const cache = new Map(); // userId -> type

  async function fetchTypeById(id) {
    if (cache.has(id)) return cache.get(id);
    try {
      const r = await fetch(`${apiBase}/users/${id}`);
      const j = await r.json();
      const t = j && j.data && j.data.attributes && j.data.attributes.diabetes_type;
      cache.set(id, t || null);
      return t || null;
    } catch (e) {
      return null;
    }
  }

  async function fetchTypeByUsername(username) {
    try {
      const r = await fetch(`${apiBase}/users?filter[q]=${encodeURIComponent(username)}`);
      const j = await r.json();
      const d = j && j.data && j.data[0];
      return d && d.attributes ? d.attributes.diabetes_type : null;
    } catch (e) {
      return null;
    }
  }

  function makeChip(text) {
    const el = document.createElement('span');
    el.className = 'DiabetesTypeTag';
    el.textContent = text;
    el.setAttribute('data-type', (text || '').toLowerCase().replace(/\s+/g, '-'));
    return el;
  }

  async function addToProfile() {
    const cardInfo =
      document.querySelector('.UserCard .UserCard-info') ||
      document.querySelector('.UserCard .UserCard-profile');
    if (!cardInfo || cardInfo.querySelector('.DiabetesTypeTag')) return;

    const userId =
      document.querySelector('.UserPage')?.getAttribute('data-id') ||
      document.querySelector('.UserCard')?.getAttribute('data-id');
    if (!userId) return;

    const type = await fetchTypeById(userId);
    if (type) cardInfo.appendChild(makeChip(type));
  }

  function addToPosts() {
    document.querySelectorAll('.Post').forEach(async (post) => {
      if (post.dataset.dcTagged) return;
      const header = post.querySelector('.Post-header');
      const avatar = post.querySelector('.Avatar');
      const uid = avatar?.getAttribute('data-user-id') || post.getAttribute('data-user-id');
      if (!header || !uid) return;

      post.dataset.dcTagged = '1';
      const type = await fetchTypeById(uid);
      if (type) {
        const chip = makeChip(type);
        chip.style.marginLeft = '8px';
        header.appendChild(chip);
      }
    });
  }

  function addToDiscussionList() {
    document.querySelectorAll('.DiscussionListItem').forEach(async (item) => {
      if (item.dataset.dcTagged) return;

      const authorLine =
        item.querySelector('.DiscussionListItem-author') ||
        item.querySelector('.item-user') ||
        item.querySelector('.item-started-by');
      const userLink = item.querySelector('a[href*="/u/"]');

      if (!authorLine || !userLink) return;
      item.dataset.dcTagged = '1';

      const username = (userLink.getAttribute('href') || '').split('/u/')[1]?.split('/')[0];
      if (!username) return;

      const type = await fetchTypeByUsername(username);
      if (type) {
        const chip = makeChip(type);
        chip.style.marginLeft = '6px';
        authorLine.appendChild(chip);
      }
    });
  }

  function run() {
    addToProfile();
    addToPosts();
    addToDiscussionList();
  }

  run();
  const mo = new MutationObserver(run);
  mo.observe(document.body, { childList: true, subtree: true });
})();
