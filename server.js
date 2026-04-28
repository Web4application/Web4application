'use server';

export async function callEndpoint() {
  const response = await fetch('https://api.vercel.com/v1/registrar/tlds/supported?teamId=string', {
    method: 'GET',
    headers: {
      'Authorization': `Bearer ${process.env.VERCEL_ACCESS_TOKEN}`,
      'Content-Type': 'application/json',
    },
    next: { revalidate: 3600 }
  });

  if (!response.ok) {
    throw new Error('Request failed');
  }

  return response.json();
}
