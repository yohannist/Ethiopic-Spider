﻿using System;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using HtmlAgilityPack;

namespace Spider.Utility
{
    public class NetworkService
    {
        public static IPAddress[] GetIpAddresses(Uri uri)
        {
            try
            {
                return Dns.GetHostAddresses(uri.Host);
            }
            catch (Exception)
            {
                return null;
            }
        }


        public static async Task<HtmlDocument> GetHtmlDocumentAsync(Uri uri)
        {
            try
            {
                var request = WebRequest.CreateHttp(uri);

                request.UserAgent = UserAgent + " - " + UserAgentDocumentation;
                request.Headers.Add(HttpRequestHeader.From, UserAgentEmailAddress);

                var response = await request.GetResponseAsync();
                var stream = response.GetResponseStream();

                if (stream == null) return null;
                var htmlDocument = new HtmlDocument();
                htmlDocument.Load(stream, Encoding.UTF8);

                return htmlDocument;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}