const BUS = new EventTarget();

export function emit(type, data) {
  BUS.dispatchEvent(new CustomEvent(type, { detail: data }));
}

export function on(type, cb) {
  BUS.addEventListener(type, (e) => cb(e.detail));
}
